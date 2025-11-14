function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 61);

T(1) = params(3)^params(6);
T(2) = params(34)/1000/params(33);
T(3) = T(2)*y(8);
T(4) = params(18)*y(21)/(1-params(18));
T(5) = y(14)*y(13)/(1-params(18))-T(4);
T(6) = T(5)^(-params(9));
T(7) = params(18)*y(21)^(-params(9));
T(8) = (1-params(55))*params(15)/2*(y(11)-y(20))^2;
T(9) = (params(24)+params(56)*x(5))^(params(33)/(params(33)-1));
T(10) = y(7)*params(54)*T(9);
T(11) = params(11)*(1-params(55))*(1+y(3))^(1-params(9));
T(12) = (y(11)-y(20))*T(11);
T(13) = 1/(params(33)-1);
T(14) = (params(24)+params(56)*x(5))^T(13);
T(15) = params(13)/(params(12)*(1-params(18))^params(10));
T(16) = T(5)^params(9);
T(17) = (1+params(10))/params(12)-1;
T(18) = y(13)^T(17);
T(19) = exp((y(15)-params(36))*(-params(32)));
T(20) = T(19)^((1+params(10))/params(12));
T(21) = T(15)*T(16)*T(18)/T(20);
T(22) = (1+y(12))/((1-params(62))*(1+(y(12)))+params(62)*(1+y(19))*(1+y(20)));
T(23) = T(22)^params(7);
T(24) = ((1+y(11))/(1+y(20)))^(1+params(8));
T(25) = (y(13)/((1-params(61))*params(31)+params(61)*y(17)))^params(49);
T(26) = T(24)*T(25);
T(27) = T(26)^(1-params(7));
T(28) = ((1+y(20))/(1+(y(20))))^(1-params(7));
T(29) = y(7)*params(54)*(params(24)+params(56)*x(5))*params(68)/(y(5)+1e-8);
T(30) = 1e-8+y(25)*y(2)*y(1)*y(13)*y(5)*(1-T(14));
T(31) = 1-(params(24)+params(56)*y(62))^T(13);
T(32) = y(13)*y(5)*T(31);
T(33) = y(17)*y(18)/(1-params(18))-T(4);
T(34) = T(15)*T(33)^params(9);
T(35) = y(17)^T(17);
T(36) = T(34)*T(35);
T(37) = T(33)^(-params(9));
T(38) = y(26)^params(33);
T(39) = y(32)^params(12);
T(40) = y(1)^(1-params(9));
T(41) = 1/(1-params(9));
T(42) = params(13)/(1+params(10));
T(43) = T(41)*y(27)^(1-params(9))-T(42)*(y(32)/(1-params(18)))^(1+params(10));
T(44) = params(53)*(y(13)-y(17))^2;
T(45) = 1/params(12);
T(46) = (y(17)/y(33))^T(45)/(1-params(18));
T(47) = T(46)^(1+params(10));
T(48) = T(41)*y(43)^(1-params(9))-T(42)*T(47);
T(49) = y(14)*y(13)/(1-params(18))-params(18)*params(19)*(y(27))/(1-params(18));
T(50) = T(15)*T(49)^params(9);
T(51) = T(18)*T(50);
T(52) = (y(13)/T(19))^T(45)/(1-params(18));
T(53) = params(13)*T(52)^params(10);
T(54) = (y(27)/(1-params(18))-T(4))^(-params(9));
T(55) = (1+y(3))^(-params(9));
T(56) = y(1)*params(13)*params(32)*272.7272727272727/params(12);
T(57) = y(2)*T(56);
T(58) = (y(13)/y(33))^T(45)/(1-params(18));
T(59) = T(58)^(1+params(10));
T(60) = y(27)^params(9);
T(61) = y(43)^params(9);

end
