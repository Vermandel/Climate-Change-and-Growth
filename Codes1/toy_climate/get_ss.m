function [m] = get_ss(gamma,theta1,theta2,beta,M_bar,sigma,Z,xi,dummy_q0)

func = @(x)([
- x + M_bar+(1-(dummy_q0*sigma*2*Z*xi*(x-M_bar)/(1-gamma*beta)/(theta1*theta2))^(1/(theta2-1)))*sigma*Z/(1-gamma);
]);
ss0_ini=[800];
options=optimset('display','off','MaxFunEvals',20000,'MaxIter',10000,'TolFun',1e-8,'TolX',1e-8); 
m=fsolve(func,ss0_ini,options);

end

