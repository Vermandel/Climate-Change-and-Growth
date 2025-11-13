function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 6
    T = [T; NaN(6 - size(T, 1), 1)];
end
T(1) = params(3)^params(6);
T(2) = params(23)/1000/params(22);
T(3) = T(2)*y(6);
T(4) = params(10)*y(12)^params(8);
T(5) = y(9)^params(7);
T(6) = y(13)^params(22);
end
