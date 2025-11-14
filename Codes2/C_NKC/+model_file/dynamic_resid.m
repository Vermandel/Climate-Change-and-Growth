function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = model_file.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(62, 1);
    residual(1) = (y(36)) - ((1-params(59))*y(11)+params(59)*(steady_state(20)));
    residual(2) = (y(17)) - (y(1)*(1+y(3)));
    residual(3) = (y(19)) - (y(3)*(1-params(4)));
    residual(4) = (y(18)) - (y(2)^(1-params(6))*T(1));
    residual(5) = (y(20)) - (y(18)/y(2)-1);
    residual(6) = (y(21)) - (y(4)*(1-y(5)));
    residual(7) = (y(22)) - (y(5)*(1-params(41)));
    residual(8) = (y(23)) - (max(y(21)*T(3),0));
    residual(9) = (y(24)) - (y(6)*(1-params(35)));
    residual(10) = (y(40)) - (1-params(46)+params(46)*y(14)+x(it_, 1));
    residual(11) = (y(39)) - (1-params(47)+params(47)*y(13)+x(it_, 2));
    residual(12) = (y(41)) - (1-params(48)+params(48)*y(15)+x(it_, 4));
    residual(13) = (y(38)) - (1-params(51)+params(51)*y(12)+x(it_, 3));
    residual(14) = (T(6)^(-params(9))) - (T(12)/T(13));
    residual(15) = (y(30)) - (1-T(15)-T(17)-params(55)*(1-y(39)*y(32)));
    residual(16) = ((y(27)-y(36))*(1+y(27))) - ((1-params(17))/params(15)+y(32)*y(39)*params(17)/params(15)+T(13)*T(22));
    residual(17) = (y(31)-params(36)) - ((1-params(37))*(y(9)-params(36))+y(41)*y(18)*y(17)*y(29)*y(21)*params(2)*(1-T(24)));
    residual(18) = (y(32)) - (T(32)+y(23)*params(54)*(params(24)+params(56)*x(it_, 5))*(params(33)+T(24)*(1-params(33))));
    residual(19) = ((1+y(28))/T(33)) - (y(38)*T(36)*T(41)*T(42)*T(43)*params(67));
    residual(20) = (y(37)) - (T(30)*params(19)*(steady_state(14))*(steady_state(13))+T(44)*(1e-8+y(41)*y(21)*(1-T(24))));
    residual(21) = (y(25)) - (log(T(45)));
    residual(22) = (y(26)) - (log(T(47))-log(T(90)));
    residual(23) = ((steady_state(16))) - (y(23)*params(54)*(params(24)+params(56)*x(it_, 5))*(params(33)+T(24)*(1-params(33)))+T(51)/T(31));
    residual(24) = (y(34)) - (1-T(17)-params(55)*(1-(steady_state(16))));
    residual(25) = (T(48)^(-params(9))) - ((1+y(35))*T(53));
    residual(26) = (y(45)) - (100*(T(15)+params(55)*(1-y(39)*y(32))));
    residual(27) = (y(65)) - (100*log(T(54)));
    residual(28) = (y(46)) - (y(23)*params(54)*100*T(55));
    residual(29) = (y(52)) - ((1+y(28))/T(13)-1);
    residual(30) = (y(47)) - (1000*y(23)*params(54)*y(50)/(y(21)+1e-8));
    residual(31) = (y(53)) - (y(27)*100);
    residual(32) = (y(54)) - (y(28)*100);
    residual(33) = (y(66)) - (y(35)*100);
    residual(34) = (y(55)) - (100*y(52));
    residual(35) = (y(57)) - (100*log(T(56)));
    residual(36) = (y(50)) - (params(24)+params(56)*x(it_, 5));
    residual(37) = (y(29)) - (y(49)*T(57));
    residual(38) = (y(49)) - (T(30));
    residual(39) = (y(42)) - ((y(41)*(params(24)+params(56)*x(it_, 5)))^T(23));
    residual(40) = (y(51)) - (y(41)*y(18)*y(17)*y(29)*y(21)*(1-y(42)));
    residual(41) = (y(30)*y(29)) - (y(43));
    residual(42) = (y(33)*y(34)) - (y(59));
    residual(43) = (y(61)) - (y(18)*y(40)*T(58)*T(61)-T(62)+y(18)*T(58)*T(63)+params(11)*y(93));
    residual(44) = (y(62)) - (y(18)*T(58)*T(66)-T(62)+params(11)*y(94));
    residual(45) = (y(69)) - (100*(y(32)-params(66))/params(66));
    residual(46) = (y(70)) - (100*(T(69)-params(66))/params(66));
    residual(47) = (y(72)) - (y(23)*params(54)*(params(24)+params(56)*x(it_, 5))*(params(33)+T(24)*(1-params(33)))*100/params(66));
    residual(48) = (y(71)) - (100*(T(32)-T(69))/params(66));
    residual(49) = (y(60)) - (T(26)*T(71));
    residual(50) = (y(73)) - (y(77)+y(74)+y(75)+y(76));
    residual(51) = (y(75)) - (y(71)*(params(17)-1)/params(15)+T(72)*y(97));
    residual(52) = (y(74)) - ((y(27)-y(36))*100-y(77)-y(75)-y(76));
    residual(53) = (y(76)) - (y(72)*(params(17)-1)/params(15)+T(72)*y(98));
    residual(54) = (y(77)) - (T(73)*(y(39)*y(32)-y(32))/params(66)+T(72)*y(99));
    residual(55) = (y(68)) - (100*log(T(74)));
    residual(56) = (y(67)) - (100*log(T(75)));
    residual(57) = (y(56)) - (100*log(T(76)));
    residual(58) = (y(44)) - (y(40)*T(77));
    residual(59) = (y(58)) - ((y(59)/T(4)-T(5))^(-params(9)));
    residual(60) = (y(63)) - (params(11)*(T(78)*y(90)/y(44)*y(95)+T(81)*T(83)*T(84)));
    residual(61) = (y(64)) - (params(11)*(T(78)*y(92)/y(58)*y(96)+T(81)*T(86)*T(87)));
    residual(62) = (y(78)) - (x(it_, 5));

end
