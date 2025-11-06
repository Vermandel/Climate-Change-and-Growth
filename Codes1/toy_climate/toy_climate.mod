
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------


var c 		$c_t$ (long_name = 'consumption'),
	A		$\lambda_t$ (long_name = 'TFP trend'), 
	m 		$\lambda_t$ (long_name = 'Carbon stock'), 
	q 		$\lambda_t$ (long_name = 'Carbon price'), 
	mu 		$\lambda_t$ (long_name = 'Abatement share');
	

parameters 	beta     	$\beta$      (long_name = 'discount factor'), 
			theta1   	$\theta_1$   (long_name = 'level abatement cost'), 
			theta2   	$\theta_2$   (long_name = 'curvature abatement cost'), 
			M_bar    	$\bar{m}$    (long_name = 'Carbon stock 1750'),  
			gamma    	$\gamma$     (long_name = 'Continuation rate carbon'), 
			A0       	$A_0$        (long_name = 'Initial TFP'), 
			E0       	$E_0$        (long_name = 'Initial emissions'), 
			M0       	$M_0$        (long_name = 'Initial Carbon stock'), 
			delta    	$\delta$     (long_name = 'Decay rate of TFP growth'), 
			xi       	$\xi$        (long_name = 'Cost global warming'), 
			ga       	$g$          (long_name = 'Initial TFP growth'), 
			sigma    	$\sigma$     (long_name = 'Emission to output'), 
			xim      	$\xi_m$      (long_name = 'Conversion factor'),
			dummy_q0 	$d$          (long_name = 'Dummy')
			;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

%%  Business cycles
beta	= .99;					% discount rate
rho_a   = .95;					% TFP shock AR

%% Climate
theta1  = 0.03;					% level abatement cost 5% output
theta2  = 2.6;					% curvature abatement cost function
M_bar   = 545;					% pre industrial carbon stock in 1750
xi		= .10/(2000-M_bar)^2;	% damage such that if M=2000 then 0.10% loss
dummy_q0= 1;					% dummy disabling abatement / force business as usual
xim		= 3/11;					% Conversion CO2 in C

%% Initial state
A0		= 125;					% initial TFP/output trillions USD in 2019
E0		= 40;					% initial flow of emissions in 2019
M0		= 950;					% initial stock of carbon in 2019
gamma	= 1-1/80;				% continuation rate of carbon = 80 years

%% TFP trend definition
delta   = 0.035; 				% decay rate of TFP
ga		= 0.03; 				% initial TFP growth in 2019

model;

	[name='Deterministic TFP']
	A		= exp(-((exp(-delta)-1))*(ga/delta-log(A(-1)/A0)))*A(-1); 
	
	[name='Resources constraint']
	c = A*(1-xi*(m-M_bar)^2-theta1*mu^theta2);
	
	[name='Carbon stock']
	m-M_bar = gamma*(m(-1)-M_bar) + (1-mu)*xim*sigma*A;
	
	[name='FOC: carbon price']
	q = (2*A*xi*(m-M_bar) + gamma*beta*(c(+1)/c)^-1*q(+1));
	
	[name='FOC: abatement']
	mu = dummy_q0*(xim*sigma/(theta1*theta2)*q)^(1/(theta2-1)); 

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

steady_state_model;
	A 	= A0*exp(ga/delta); 
	sigma = E0/A0;
	m 	= get_ss(gamma,theta1,theta2,beta,M_bar,xim*sigma,A,xi,dummy_q0);
	q 	= 2*A*xi*(m-M_bar)/(1-gamma*beta);
	mu 	= dummy_q0*(xim*sigma*q/(theta1*theta2))^(1/(theta2-1));
	c 	= A*(1-xi*(m-M_bar)^2-theta1*mu^theta2);
end;

steady;

%%%%%%%%%%      SIMULATIONS      %%%%%%%%%%
%%%%%%%%%%%%%% CARBON POLICY %%%%%%%%%%%%%%

% get ss
[oo_.steady_state, M_.params] = feval([M_.fname '.steadystate'],oo_.steady_state, zeros(M_.exo_nbr,1), M_.params);


histval;
  A(0) = A0;
  m(0) = M0;           
end;

perfect_foresight_setup(periods=1000);
perfect_foresight_solver;


endo_simu11 = oo_.endo_simul;

%%%%%%%%%%      SIMULATIONS      %%%%%%%%%%
%%%%%%%%%%%%% NO CARBON POLICY %%%%%%%%%%%%%

set_param_value('dummy_q0',0);
% get ss
[oo_.steady_state, M_.params] = feval([M_.fname '.steadystate'],oo_.steady_state, zeros(M_.exo_nbr,1), M_.params);
steady;

perfect_foresight_solver;



endo_simul2 = oo_.endo_simul;

%%%%%%%%%%%%% PLOT %%%%%%%%%%%%%

myarr = char('c','m','q','mu');
	
figure;
for i1=1:size(myarr,1)
	subplot(2,2,i1)
	idx = strmatch(myarr(i1,:),M_.endo_names,'exact');
	T=2019:(2019+size(endo_simu11(idx,2:end),2)-1);
	plot(T,endo_simu11(idx,2:end),'LineWidth',2)
	title(M_.endo_names_long{idx});
	if exist('endo_simul2')
		hold on;
		plot(T,endo_simul2(idx,2:end),'LineWidth',2)
		hold off;
	end
	grid on;
	xlim([min(T) max(T)])
	eval([ myarr(i1,:) ' = endo_simu11(idx,1:end);']);
	xlim([2020 2200])
end
legend('carbon policy','no carbon policy')