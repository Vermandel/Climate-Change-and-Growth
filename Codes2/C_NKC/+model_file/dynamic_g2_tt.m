function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 264);

T = model_file.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(223) = getPowerDeriv(T(6),(-params(9)),2);
T(224) = getPowerDeriv(T(8),(-params(9)),2);
T(225) = params(18)*getPowerDeriv(y(88),(-params(9)),2);
T(226) = y(23)*params(54)*params(56)*params(56)*getPowerDeriv(params(24)+params(56)*x(it_, 5),params(33)/(params(33)-1),2);
T(227) = getPowerDeriv(y(30)*y(83)/(y(30)*y(29)),(-params(9)),2);
T(228) = params(56)*params(56)*getPowerDeriv(params(24)+params(56)*x(it_, 5),T(23),2);
T(229) = getPowerDeriv(T(6),params(9),2);
T(230) = getPowerDeriv(y(29),T(28),2);
T(231) = (T(25)*T(114)*T(121)*T(122)+T(29)*T(25)*T(114)*T(114)*T(229)+T(25)*T(114)*T(121)*T(122)+T(25)*T(26)*T(230))/T(31);
T(232) = (T(29)*T(25)*(T(121)*T(209)+T(114)*T(150)*T(229))+T(122)*T(25)*T(121)*T(150))/T(31);
T(233) = T(157)*(-params(32))*(-params(32))*T(30)+(-params(32))*T(30)*(-params(32))*T(30)*getPowerDeriv(T(30),T(27),2);
T(234) = (T(31)*T(31)*(-(T(25)*T(26)*T(29)*T(233)))-(-(T(25)*T(26)*T(29)*T(158)))*(T(31)*T(158)+T(31)*T(158)))/(T(31)*T(31)*T(31)*T(31));
T(235) = getPowerDeriv((1+y(27))/(1+y(36)),1+params(8),2);
T(236) = getPowerDeriv(T(40),1-params(7),2);
T(237) = T(39)*T(192)*T(236);
T(238) = getPowerDeriv(T(35),params(7),2);
T(239) = getPowerDeriv(T(38),params(49),2);
T(240) = getPowerDeriv((1+y(36))/(1+y(11)),params(60),2);
T(241) = T(101)*y(41)*(1-T(24));
T(242) = getPowerDeriv(T(48),params(9),2);
T(243) = getPowerDeriv(T(48),(-params(9)),2);
T(244) = getPowerDeriv(T(52),(-params(9)),2);
T(245) = getPowerDeriv(y(41)*(params(24)+params(56)*x(it_, 5)),T(23),2);
T(246) = getPowerDeriv(y(17),1-params(9),2);
T(247) = params(52)*(T(110)*(-((-y(28))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7))+T(109)*2*T(109));
T(248) = params(52)*(T(110)*(-1)/(y(7)*y(7))+T(109)*2*1/y(7));
T(249) = params(52)*1/y(7)*2*1/y(7);
T(250) = getPowerDeriv(y(33)/y(49),T(64),2);
T(251) = getPowerDeriv(T(65),1+params(10),2);
T(252) = getPowerDeriv(T(67),params(9),2);
T(253) = getPowerDeriv(y(29)/T(30),T(64),2);
T(254) = getPowerDeriv(T(70),params(10),2);
T(255) = (-(y(83)*params(11)*(1-params(55))))/(y(29)*y(29));
T(256) = (-((-(y(83)*params(11)*(1-params(55))*(1+y(81))))*(y(29)+y(29))))/(y(29)*y(29)*y(29)*y(29));
T(257) = (-(params(11)*(1-params(55))*(1+y(81))))/(y(29)*y(29));
T(258) = getPowerDeriv(y(43)/T(4)-T(5),(-params(9)),2);
T(259) = getPowerDeriv(y(59)/T(4)-T(5),(-params(9)),2);
T(260) = getPowerDeriv(1+y(19),(-params(9)),2);
T(261) = getPowerDeriv(y(83)/y(91),T(64),2);
T(262) = getPowerDeriv(T(82),1+params(10),2);
T(263) = getPowerDeriv(y(85)/y(91),T(64),2);
T(264) = getPowerDeriv(T(85),1+params(10),2);

end
