function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = model_file.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 15
    T = [T; NaN(15 - size(T, 1), 1)];
end
T(14) = getPowerDeriv((1+y(41))*y(47)/y(28),params(7),2);
T(15) = y(24)*getPowerDeriv(y(32),params(22),2);
end
