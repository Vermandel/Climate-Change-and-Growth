function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = model_file.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(19, 1);
    residual(1) = (y(20)) - (y(1)*(1+y(3)));
    residual(2) = (y(22)) - (y(3)*(1-params(4)));
    residual(3) = (y(21)) - (y(2)^(1-params(6))*T(1));
    residual(4) = (y(23)) - (y(4)*(1-params(27)));
    residual(5) = (y(24)) - (max(y(23)*T(3),0));
    residual(6) = (y(25)) - (y(6)*(1-params(24)));
    residual(7) = (y(38)) - (1-params(33)+params(33)*y(19)+x(1));
    residual(8) = (y(29)) - (T(4)*((1+y(41))*y(47)/y(28))^params(7));
    residual(9) = (y(30)) - (T(5)*T(6));
    residual(10) = (y(27)) - (y(31)*y(38)*y(33));
    residual(11) = (y(30)) - (y(38)*y(33)*(1-y(24)*(params(22)*y(34)*(1-y(32))+T(7))));
    residual(12) = (y(32)) - ((params(14)+params(34)*x(2))^(1/(params(22)-1)));
    residual(13) = (y(35)) - (y(21)*y(20)*y(27)*y(23)*(1-y(32)));
    residual(14) = (y(27)) - (y(28)+y(27)*y(24)*T(7));
    residual(15) = (y(26)) - ((1-params(25))*y(7)+y(35)*params(2));
    residual(16) = (y(36)) - (y(26)*params(37));
    residual(17) = (y(34)) - (params(14)+params(34)*x(2));
    residual(18) = (y(33)) - (exp(y(7)*(-params(21))));
    residual(19) = (y(37)) - (1000*y(24)*y(34)/(y(23)+1e-8));
end
