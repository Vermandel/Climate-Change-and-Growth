function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 93);

T = model_file.static_resid_tt(T, y, x, params);

T(62) = getPowerDeriv(y(1),1-params(9),1);
T(63) = getPowerDeriv(1+y(3),(-params(9)),1);
T(64) = getPowerDeriv((1+y(11))/(1+y(20)),1+params(8),1);
T(65) = getPowerDeriv(T(26),1-params(7),1);
T(66) = ((1-params(62))*(1+(y(12)))+params(62)*(1+y(19))*(1+y(20)))*((1-params(62))*(1+(y(12)))+params(62)*(1+y(19))*(1+y(20)));
T(67) = ((1-params(62))*(1+(y(12)))+params(62)*(1+y(19))*(1+y(20))-(1+y(12))*(1-params(62)))/T(66);
T(68) = getPowerDeriv(T(22),params(7),1);
T(69) = getPowerDeriv(T(5),(-params(9)),1);
T(70) = y(14)/(1-params(18))*T(69);
T(71) = getPowerDeriv(T(5),params(9),1);
T(72) = getPowerDeriv(y(13),T(17),1);
T(73) = (T(18)*T(15)*y(14)/(1-params(18))*T(71)+T(15)*T(16)*T(72))/T(20);
T(74) = getPowerDeriv(y(13)/((1-params(61))*params(31)+params(61)*y(17)),params(49),1);
T(75) = getPowerDeriv(T(49),params(9),1);
T(76) = getPowerDeriv(y(13)/T(19),T(45),1);
T(77) = getPowerDeriv(T(52),params(10),1);
T(78) = getPowerDeriv(y(13)/y(33),T(45),1);
T(79) = getPowerDeriv(T(58),1+params(10),1);
T(80) = T(18)*T(15)*T(71)*y(13)/(1-params(18))/T(20);
T(81) = (-params(32))*T(19)*getPowerDeriv(T(19),(1+params(10))/params(12),1);
T(82) = getPowerDeriv(T(33),params(9),1);
T(83) = getPowerDeriv(T(33),(-params(9)),1);
T(84) = y(18)/(1-params(18))*T(83);
T(85) = getPowerDeriv(y(17)/y(33),T(45),1);
T(86) = getPowerDeriv(T(46),1+params(10),1);
T(87) = 1/y(33)*T(85)/(1-params(18))*T(86);
T(88) = (-((1+y(12))*params(62)*(1+y(20))))/T(66);
T(89) = (-(params(18)/(1-params(18))));
T(90) = params(18)*getPowerDeriv(y(21),(-params(9)),1);
T(91) = getPowerDeriv(y(27)/(1-params(18))-T(4),(-params(9)),1);
T(92) = getPowerDeriv(y(43)/(1-params(18))-T(4),(-params(9)),1);
T(93) = T(86)*T(85)*(-y(17))/(y(33)*y(33))/(1-params(18));

end
