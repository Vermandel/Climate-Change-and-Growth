function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 222);

T = model_file.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(91) = getPowerDeriv(y(17),1-params(9),1);
T(92) = T(79)*y(80);
T(93) = y(29)*(1+y(20))/y(8);
T(94) = getPowerDeriv(1+y(19),(-params(9)),1);
T(95) = params(11)*(1-params(55))*getPowerDeriv(1+y(81),1-params(9),1);
T(96) = T(19)*T(95);
T(97) = T(20)*T(96);
T(98) = (y(82)-y(87))*T(97);
T(99) = y(83)*params(11)*(1-params(55))/y(29);
T(100) = y(29)*(1+y(19))/y(8);
T(101) = (-(y(23)*params(54)*(params(24)+params(56)*x(it_, 5))*params(68)))/((y(21)+1e-8)*(y(21)+1e-8));
T(102) = params(54)*(params(24)+params(56)*x(it_, 5))*params(68)/(y(21)+1e-8);
T(103) = 1/(1+y(36));
T(104) = getPowerDeriv((1+y(27))/(1+y(36)),1+params(8),1);
T(105) = T(39)*T(103)*T(104);
T(106) = getPowerDeriv(T(40),1-params(7),1);
T(107) = 1/T(34);
T(108) = getPowerDeriv(T(35),params(7),1);
T(109) = (-y(28))/(y(7)*y(7));
T(110) = 2*(y(28)/y(7)-1);
T(111) = params(52)*T(109)*T(110);
T(112) = params(52)*T(110)*1/y(7);
T(113) = (-(y(29)*(1+y(19))*(1+y(20))))/(y(8)*y(8));
T(114) = y(30)/T(4);
T(115) = getPowerDeriv(T(6),(-params(9)),1);
T(116) = (-(y(30)*y(30)*y(83)))/(y(30)*y(29)*y(30)*y(29));
T(117) = getPowerDeriv(y(30)*y(83)/(y(30)*y(29)),(-params(9)),1);
T(118) = (-y(83))/(y(29)*y(29));
T(119) = T(20)*T(18)*T(116)*T(117)+T(18)*T(19)*T(118);
T(120) = (y(82)-y(87))*T(119);
T(121) = getPowerDeriv(T(6),params(9),1);
T(122) = getPowerDeriv(y(29),T(28),1);
T(123) = (T(29)*T(25)*T(114)*T(121)+T(25)*T(26)*T(122))/T(31);
T(124) = 1/((1-params(61))*params(31)+params(61)*y(33));
T(125) = getPowerDeriv(T(38),params(49),1);
T(126) = T(37)*T(124)*T(125);
T(127) = (1+y(19))*(1+y(20))/y(8);
T(128) = getPowerDeriv(T(67),params(9),1);
T(129) = 1/T(30);
T(130) = getPowerDeriv(y(29)/T(30),T(64),1);
T(131) = T(129)*T(130)/T(4);
T(132) = getPowerDeriv(T(70),params(10),1);
T(133) = params(13)*T(131)*T(132);
T(134) = (-(y(83)*params(11)*(1-params(55))*(1+y(81))))/(y(29)*y(29));
T(135) = 1/params(31);
T(136) = 1/y(33);
T(137) = y(84)/T(4);
T(138) = getPowerDeriv(T(8),(-params(9)),1);
T(139) = y(30)/(y(30)*y(29));
T(140) = T(18)*T(117)*T(139);
T(141) = 1/y(29);
T(142) = T(20)*T(140)+T(18)*T(19)*T(141);
T(143) = (y(82)-y(87))*T(142);
T(144) = params(11)*(1-params(55))*(1+y(81))/y(29);
T(145) = 1/y(91);
T(146) = getPowerDeriv(y(83)/y(91),T(64),1);
T(147) = T(145)*T(146)/T(4);
T(148) = getPowerDeriv(T(82),1+params(10),1);
T(149) = T(147)*T(148);
T(150) = y(29)/T(4);
T(151) = (y(30)*y(29)*y(83)-y(29)*y(30)*y(83))/(y(30)*y(29)*y(30)*y(29));
T(152) = T(18)*T(117)*T(151);
T(153) = T(20)*T(152);
T(154) = (y(82)-y(87))*T(153);
T(155) = T(29)*T(25)*T(121)*T(150)/T(31);
T(156) = y(83)/T(4);
T(157) = getPowerDeriv(T(30),T(27),1);
T(158) = (-params(32))*T(30)*T(157);
T(159) = (-(y(29)*(-params(32))*T(30)))/(T(30)*T(30));
T(160) = T(130)*T(159)/T(4);
T(161) = params(13)*T(132)*T(160);
T(162) = (-(y(29)*params(61)))/(((1-params(61))*params(31)+params(61)*y(33))*((1-params(61))*params(31)+params(61)*y(33)));
T(163) = T(125)*T(162);
T(164) = y(34)/T(4);
T(165) = getPowerDeriv(T(48),params(9),1);
T(166) = getPowerDeriv(y(33),T(28),1);
T(167) = T(50)*T(25)*T(164)*T(165)+T(49)*T(166);
T(168) = getPowerDeriv(T(48),(-params(9)),1);
T(169) = 1/y(49);
T(170) = getPowerDeriv(y(33)/y(49),T(64),1);
T(171) = T(169)*T(170)/T(4);
T(172) = getPowerDeriv(T(65),1+params(10),1);
T(173) = (-(T(60)*T(171)*T(172)));
T(174) = (-y(29))/(y(33)*y(33));
T(175) = y(86)/T(4);
T(176) = getPowerDeriv(T(52),(-params(9)),1);
T(177) = getPowerDeriv(y(85)/y(91),T(64),1);
T(178) = T(145)*T(177)/T(4);
T(179) = getPowerDeriv(T(85),1+params(10),1);
T(180) = y(33)/T(4);
T(181) = y(85)/T(4);
T(182) = T(34)*T(34);
T(183) = (-((1+y(7))*params(62)*(1+y(11))))/T(182);
T(184) = T(108)*T(183);
T(185) = T(33)*T(33);
T(186) = (-((1+y(7))*params(62)*(1+y(10))))/T(182);
T(187) = T(108)*T(186);
T(188) = (-(1+y(36)))/((1+y(11))*(1+y(11)));
T(189) = getPowerDeriv((1+y(36))/(1+y(11)),params(60),1);
T(190) = T(188)*T(189);
T(191) = (-(1+y(27)))/((1+y(36))*(1+y(36)));
T(192) = T(104)*T(191);
T(193) = 1/(1+(steady_state(20)))*getPowerDeriv((1+y(36))/(1+(steady_state(20))),1-params(7),1);
T(194) = T(189)*1/(1+y(11));
T(195) = (-(params(18)/T(4)));
T(196) = getPowerDeriv(y(43)/T(4)-T(5),(-params(9)),1);
T(197) = getPowerDeriv(y(59)/T(4)-T(5),(-params(9)),1);
T(198) = params(18)*getPowerDeriv(y(88),(-params(9)),1);
T(199) = params(11)*(-y(89))/(y(40)*y(40));
T(200) = params(11)*1/y(40);
T(201) = getPowerDeriv(y(41)*(params(24)+params(56)*x(it_, 5)),T(23),1);
T(202) = params(56)*getPowerDeriv(params(24)+params(56)*x(it_, 5),params(33)/(params(33)-1),1);
T(203) = y(23)*params(54)*T(202);
T(204) = params(56)*getPowerDeriv(params(24)+params(56)*x(it_, 5),T(23),1);
T(205) = y(23)*params(54)*params(56)*params(68)/(y(21)+1e-8);
T(206) = y(41)*y(18)*y(17)*y(29)*y(21)*(-T(204));
T(207) = getPowerDeriv(y(42),params(33),1);
T(208) = T(59)*getPowerDeriv(y(43),1-params(9),1);
T(209) = 1/T(4);
T(210) = getPowerDeriv(y(43),params(9),1);
T(211) = getPowerDeriv(y(48),params(12),1);
T(212) = (-(T(60)*T(209)*getPowerDeriv(y(48)/T(4),1+params(10),1)));
T(213) = T(170)*(-y(33))/(y(49)*y(49))/T(4);
T(214) = (-(T(60)*T(172)*T(213)));
T(215) = T(146)*(-y(83))/(y(91)*y(91))/T(4);
T(216) = T(148)*T(215);
T(217) = T(177)*(-y(85))/(y(91)*y(91))/T(4);
T(218) = T(179)*T(217);
T(219) = T(59)*getPowerDeriv(y(59),1-params(9),1);
T(220) = getPowerDeriv(y(59),params(9),1);
T(221) = (-(params(56)*getPowerDeriv(params(24)+params(56)*y(16),T(23),1)));
T(222) = y(8)*y(4)*T(221);

end
