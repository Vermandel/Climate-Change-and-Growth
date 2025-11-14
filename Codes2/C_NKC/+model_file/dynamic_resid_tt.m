function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 90);

T(1) = params(3)^params(6);
T(2) = params(34)/1000/params(33);
T(3) = T(2)*y(24);
T(4) = 1-params(18);
T(5) = params(18)*y(37)/T(4);
T(6) = y(30)*y(29)/T(4)-T(5);
T(7) = y(89)/y(40)*params(11);
T(8) = y(84)*y(83)/T(4)-params(18)*y(88)/T(4);
T(9) = params(18)*y(88)^(-params(9));
T(10) = T(4)*T(8)^(-params(9))+T(9);
T(11) = T(7)*T(10);
T(12) = T(11)*(1+y(28));
T(13) = 1+y(82);
T(14) = (1-params(55))*params(15)/2;
T(15) = T(14)*(y(27)-y(36))^2;
T(16) = (params(24)+params(56)*x(it_, 5))^(params(33)/(params(33)-1));
T(17) = y(23)*params(54)*T(16);
T(18) = params(11)*(1-params(55))*(1+y(81))^(1-params(9));
T(19) = (y(30)*y(83)/(y(30)*y(29)))^(-params(9));
T(20) = y(83)/y(29);
T(21) = T(18)*T(19)*T(20);
T(22) = T(21)*(y(82)-y(87));
T(23) = 1/(params(33)-1);
T(24) = (params(24)+params(56)*x(it_, 5))^T(23);
T(25) = params(13)/(params(12)*T(4)^params(10));
T(26) = T(6)^params(9);
T(27) = (1+params(10))/params(12);
T(28) = T(27)-1;
T(29) = y(29)^T(28);
T(30) = exp((y(9)-params(36))*(-params(32)));
T(31) = T(30)^T(27);
T(32) = T(25)*T(26)*T(29)/T(31);
T(33) = (1-params(62))*(1+(steady_state(12)))+params(62)*(1+y(35))*(1+y(36));
T(34) = (1-params(62))*(1+(steady_state(12)))+params(62)*(1+y(10))*(1+y(11));
T(35) = (1+y(7))/T(34);
T(36) = T(35)^params(7);
T(37) = ((1+y(27))/(1+y(36)))^(1+params(8));
T(38) = y(29)/((1-params(61))*params(31)+params(61)*y(33));
T(39) = T(38)^params(49);
T(40) = T(37)*T(39);
T(41) = T(40)^(1-params(7));
T(42) = ((1+y(36))/(1+(steady_state(20))))^(1-params(7));
T(43) = ((1+y(36))/(1+y(11)))^params(60);
T(44) = y(23)*params(54)*(params(24)+params(56)*x(it_, 5))*params(68)/(y(21)+1e-8);
T(45) = y(29)*(1+y(19))*(1+y(20))/y(8);
T(46) = y(18)*y(17)*y(29)*y(21)*(1-T(24));
T(47) = 1e-8+y(41)*T(46);
T(48) = y(33)*y(34)/T(4)-T(5);
T(49) = T(25)*T(48)^params(9);
T(50) = y(33)^T(28);
T(51) = T(49)*T(50);
T(52) = y(86)*y(85)/T(4)-params(18)*y(88)/T(4);
T(53) = params(11)*(T(9)+T(4)*T(52)^(-params(9)));
T(54) = y(43)/params(31);
T(55) = y(42)^params(33);
T(56) = y(33)/params(31);
T(57) = y(48)^params(12);
T(58) = y(17)^(1-params(9));
T(59) = 1/(1-params(9));
T(60) = params(13)/(1+params(10));
T(61) = T(59)*y(43)^(1-params(9))-T(60)*(y(48)/T(4))^(1+params(10));
T(62) = params(52)*(y(28)/y(7)-1)^2;
T(63) = params(53)*(y(29)-y(33))^2;
T(64) = 1/params(12);
T(65) = (y(33)/y(49))^T(64)/T(4);
T(66) = T(59)*y(59)^(1-params(9))-T(60)*T(65)^(1+params(10));
T(67) = y(30)*y(29)/T(4)-params(18)*params(19)*(steady_state(27))/T(4);
T(68) = T(25)*T(67)^params(9);
T(69) = T(29)*T(68);
T(70) = (y(29)/T(30))^T(64)/T(4);
T(71) = params(13)*T(70)^params(10);
T(72) = y(83)*params(11)*(1-params(55))*(1+y(81))/y(29);
T(73) = 100*(params(17)-1)/params(15);
T(74) = y(43)/(steady_state(27));
T(75) = y(29)/params(31);
T(76) = y(29)/y(33);
T(77) = (y(43)/T(4)-T(5))^(-params(9));
T(78) = (1+y(19))^(-params(9));
T(79) = params(13)*params(32)*272.7272727272727/params(12);
T(80) = T(79)*y(79);
T(81) = T(80)*y(80);
T(82) = (y(83)/y(91))^T(64)/T(4);
T(83) = T(82)^(1+params(10));
T(84) = y(43)^params(9);
T(85) = (y(85)/y(91))^T(64)/T(4);
T(86) = T(85)^(1+params(10));
T(87) = y(59)^params(9);
T(88) = 1-(params(24)+params(56)*y(16))^T(23);
T(89) = y(8)*y(4)*T(88);
T(90) = 1e-8+y(15)*y(2)*y(1)*T(89);

end
