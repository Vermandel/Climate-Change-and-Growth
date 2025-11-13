function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 7
    T = [T; NaN(7 - size(T, 1), 1)];
end
T(1) = params(3)^params(6);
T(2) = params(23)/1000/params(22);
T(3) = T(2)*y(25);
T(4) = 1/params(9);
T(5) = params(10)*y(31)^params(8);
T(6) = y(28)^params(7);
T(7) = y(32)^params(22);
end
