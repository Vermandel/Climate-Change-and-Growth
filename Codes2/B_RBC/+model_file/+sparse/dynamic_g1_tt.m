function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = model_file.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 13
    T = [T; NaN(13 - size(T, 1), 1)];
end
T(8) = y(47)/y(28);
T(9) = getPowerDeriv((1+y(41))*y(47)/y(28),params(7),1);
T(10) = (-((1+y(41))*y(47)))/(y(28)*y(28));
T(11) = getPowerDeriv(y(28),params(7),1);
T(12) = params(10)*getPowerDeriv(y(31),params(8),1);
T(13) = getPowerDeriv(y(32),params(22),1);
end
