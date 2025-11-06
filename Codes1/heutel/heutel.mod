%**************************************************************************
% Heutel(2012)
% How should environmental policy respond to business cycles? Optimal policy under persistent productivity shocks
% PSE Course on Environmental Macro
%**************************************************************************
close all;

var
    c       ${c}$           (long_name='Consumption'),
    y       ${y}$           (long_name='Output'),
    k       ${k}$           (long_name='Capital stock'),
    mu      ${\mu}$         (long_name='Abatement intensity (policy instrument)'),
    e       ${e}$           (long_name='Emissions flow'),
    x       ${x}$           (long_name='Pollution stock'),
    z       ${z}$           (long_name='Abatement expenditure'),
    i       ${i}$           (long_name='Investment'),
    lb_x    ${\lambda_{x}}$ (long_name='Shadow cost of pollution stock'),
    lb_y    ${\lambda_{y}}$ (long_name='Lagrange multiplier on resource constraint'),
    a       ${A}$           (long_name='Total factor productivity (TFP)');

varexo
    e_a   ${\varepsilon_{A}}$   (long_name='TFP innovation (shock to productivity)');

parameters     
	beta       ${\beta}$        (long_name='Discount factor'),
    deltaK     ${\delta_{K}}$   (long_name='Capital depreciation rate'),
    alpha      ${\alpha}$       (long_name='Capital share in production'),
    rho_a      ${\rho_{A}}$     (long_name='Persistence of TFP shock'),
    sigma_a    ${\sigma_{A}}$   (long_name='Standard deviation of TFP shock'),
    sigma      ${\sigma}$       (long_name='Emission intensity scale parameter'),
    gamma      ${\gamma}$       (long_name='Elasticity of emissions with respect to output'),
    deltaX     ${\delta_{X}}$   (long_name='Decay rate of pollution stock'),
    theta1     ${\theta_{1}}$   (long_name='Abatement cost scale parameter'),
    theta2     ${\theta_{2}}$   (long_name='Abatement cost curvature parameter'),
    phic       ${\phi_{c}}$     (long_name='Utility curvature on consumption (CRRA)'),
    d2         ${d_{2}}$        (long_name='Quadratic coefficient in damage function'),
    d1         ${d_{1}}$        (long_name='Linear coefficient in damage function'),
    d0         ${d_{0}}$        (long_name='Constant term in damage function'),
    DUM_tax    ${\text{DUM}_{tax}}$ (long_name='Policy toggle: activates tax/transfers block');
	


/* Table 2 */
beta    = 0.98267;        % discount factor (quarterly, implies annual rate ≈ 0.93)
deltaK  = 0.025;          % capital depreciation rate per period
rho_a   = 0.95;           % persistence parameter of TFP AR(1) process
sigma_a = 0.007;          % standard deviation of TFP innovation shock
alpha   = 0.36;           % capital share in production function
deltaX  = 1 - 0.9979;     % pollution decay rate (≈ 0.0021 per period, slow adjustment)
theta1  = 0.05607;        % abatement cost scale parameter (from Nordhaus DICE calibration)
theta2  = 2.8;            % abatement cost curvature parameter (>1 implies convex costs)
gamma   = (1 - 0.696);    % 1 - elasticity of emissions w.r.t. output (implies elasticity = 0.696)
phic    = 2;              % CRRA coefficient on consumption (risk aversion)
d2      = 1.4647e-8;      % quadratic coefficient in damage function (from Nordhaus)
d1      = -6.6722e-6;     % linear coefficient in damage function (from Nordhaus)
d0      = 1.395e-3;       % constant term in damage function (from Nordhaus)
sigma   = 0.35;            % emission intensity parameter (baseline emission-to-output ratio)
DUM_tax = 1;              % policy toggle: 0 = no tax, 1 = environmental tax active

model;
	[name='FOC: y']
	lb_y = 1 - theta1*mu^theta2 - lb_x*(1 - gamma)*e/y;              % Resource constraint shadow price
	[name='FOC: k']
	c^(-phic) = beta * c(+1)^(-phic) * ( (1 - deltaK) + alpha * y(+1)/k * lb_y );  % Intertemporal Euler equation
	[name='FOC: x']
	lb_x = DUM_tax * lb_y * (d1 + 2*d2*x) / (1 - d2*x^2 - d1*x - d0) * y 
		   + beta * (c(+1)/c)^(-phic) * (1 - deltaX) * lb_x(+1);    % Shadow cost of pollution (law of motion)
	[name='FOC: mu']
	mu^(theta2 - 1) = ( sigma / (theta1 * theta2) * lb_x * y^(-gamma) )^(1/1);       % Optimal abatement FOC
	[name='resource allocation']
	c = y - i - z;                                                   % Resource constraint: goods market clearing
	[name='capital accumulation']
	i = k - (1 - deltaK) * k(-1);                                    % Law of motion for capital
	[name='pollution stock']
	x = (1 - deltaX) * x(-1) + e + 3 * steady_state(e);              % Pollution stock dynamics
	[name='CO_2 emissions']
	e = sigma * (1 - mu) * y^(1 - gamma);                            % Domestic emissions
	[name='abatement spending']
	z = theta1 * mu^theta2 * y;                                      % Total abatement expenditure
	[name='production']
	y = (1 - d2*x^2 - d1*x - d0) * a * (k(-1))^alpha;                % Production function with climate damages
	[name='TFP shock']
	log(a) = rho_a * log(a(-1)) + e_a;                               % TFP process (AR(1))
end;

% ------------------------ %
% Steady State Computation %
% ------------------------ %

steady_state_model;
	a    = 1;
	[lb_x,y] = heutel_ss(sigma,gamma,deltaX,DUM_tax,d0,d1,d2,beta,deltaK,alpha,theta1,theta2,a);
	mu   = (sigma/(theta1*theta2)*lb_x*y^-gamma )^(1/(theta2-1));
	e    = sigma*(1-mu)*y^(1-gamma); 
	x    = 4*e/deltaX;
	lb_y = 1-theta1*mu^theta2-lb_x*(1-gamma)*e/y;
	y_k  = (1/beta - (1-deltaK))/(alpha*lb_y);
	k 	 = y/y_k;
	i    = k-(1-deltaK)*k;
	z    = theta1*mu^theta2*y;
	c    = y-i-z;
end;

steady;

shocks;
	var e_a; stderr sigma_a;
end;



% Solve model: Optimal Carbon Price Policy
stoch_simul(order=1,irf=30) y c i x e mu lb_x z a;

% linear solution method of the form
% y(t) - yss = P*(y(t-1) - yss) + Q*epsilon(t)

% storing irfs: x(t) = y(t)-yss
xt1    = oo_.irfs;
yss1   = oo_.dr.ys;

% Solve model: No carbon price
set_param_value('DUM_tax',0);
stoch_simul(order=1,irf=30) y c i x e mu lb_x z a;

% storing irfs: x(t) = y(t)-yss
xt2    = oo_.irfs;
yss2   = oo_.dr.ys;


nx = 3;
ny = 3;
for ix=1:M_.exo_nbr
	figure('Name',M_.exo_names_long{ix});
	for iy=1:size(var_list_,1)
		idx = strmatch(var_list_{iy},M_.endo_names,'exact');
		subplot(nx,ny,iy)
		if abs(yss2(idx)) < 1e-6
			yss1(idx) = 1;  % no division by ss
			yss2(idx) = 1;  % no division by ss
		end
		plot(100*eval(['irfs1.' var_list_{iy} '_' M_.exo_names{ix} ])/yss1(idx),'linewidth',2)
		hold on;
		plot(100*eval(['irfs2.' var_list_{iy} '_' M_.exo_names{ix} ])/yss2(idx),'linewidth',2)	
		hold off;
		title(M_.endo_names_long{iy})
		grid on;
	end
end
