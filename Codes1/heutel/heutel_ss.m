function [lb_x,y] = heutel_ss(sigma,gamma,deltaX,DUM_tax,d0,d1,d2,beta,deltaK,alpha,theta1,theta2,a)
%HEUTEL_SS Summary of this function goes here
%   Detailed explanation goes here

% x(1) : x
% x(2) : y
% x(3) : mu
% x(4) : lb_x
% x(5) : lb_y
fun = @(x) [
	% x    = 4*sigma*(1-mu)*y^(1-gamma)/deltaX;
    - x(1)    + 4*sigma*(1-x(3))*x(2)^(1-gamma)/deltaX;
    % lb_x = DUM_tax*lb_y*(d1+2*d2*x)/(1-d2*x^2-d1*x-d0)*y/((1-beta*(1-deltaX)))  ;
    - x(4) + DUM_tax*x(5)*(d1+2*d2*x(1))/(1-d2*x(1)^2-d1*x(1)-d0)*x(2)/((1-beta*(1-deltaX)))  ;
    % lb_y = 1-theta1*mu^theta2-lb_x*(1-gamma)* sigma*(1-mu)*y^(-gamma);
    - x(5) + 1-theta1*x(3)^theta2-x(4)*(1-gamma)* sigma*(1-x(3))*x(2)^(-gamma);
	% y    = ((1-d2*x^2-d1*x-d0)*a*((1/beta - (1-deltaK))/(alpha*lb_y))^(-alpha))^(1/(1-alpha));
    - x(2)    + ((1-d2*x(1)^2-d1*x(1)-d0)*a*((1/beta - (1-deltaK))/(alpha*x(5)))^(-alpha))^(1/(1-alpha));
    % mu = (sigma/(theta1*theta2)*lb_x*y^-gamma )^(1/(theta2-1));
    - x(3) + (sigma/(theta1*theta2)*x(4)*x(2)^-gamma)^(1/(theta2-1))
    ];

x0 = [ 800 3 0 0 1];
options = optimoptions('fsolve', ...
    'Display', 'iter', ...
    'Algorithm', 'trust-region', ...
    'FunctionTolerance', 1e-12, ...
    'StepTolerance', 1e-12, ...
    'MaxIterations', 1000);
rez = fsolve(fun,x0,options);
x    = rez(1);
y    = rez(2);
mu   = rez(3);
lb_x = rez(4)*(rez(4)>1e-6);
lb_y = rez(5);
end

