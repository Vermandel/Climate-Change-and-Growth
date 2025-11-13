function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(4, 1);
  T(2)=y(32)^params(22);
  y(30)=y(38)*y(33)*(1-y(24)*(params(22)*y(34)*(1-y(32))+T(2)));
  y(27)=y(31)*y(38)*y(33);
  y(35)=y(21)*y(20)*y(27)*y(23)*(1-y(32));
  residual(1)=(y(27))-(y(28)+y(27)*y(24)*T(2));
  T(3)=exp(y(7)*(-params(21)));
  residual(2)=(y(33))-(T(3));
  T(4)=params(10)*y(31)^params(8);
  T(5)=y(28)^params(7);
  residual(3)=(y(30))-(T(4)*T(5));
  residual(4)=(y(26))-((1-params(25))*y(7)+y(35)*params(2));
if nargout > 3
    g1_v = NaN(10, 1);
g1_v(1)=(-1);
g1_v(2)=(-(T(4)*getPowerDeriv(y(28),params(7),1)));
g1_v(3)=y(38)*y(31)-y(24)*T(2)*y(38)*y(31);
g1_v(4)=1;
g1_v(5)=y(38)*(1-y(24)*(params(22)*y(34)*(1-y(32))+T(2)));
g1_v(6)=(-(params(2)*y(21)*y(20)*y(23)*(1-y(32))*y(38)*y(31)));
g1_v(7)=y(38)*y(33)-y(38)*y(33)*y(24)*T(2);
g1_v(8)=(-(T(5)*params(10)*getPowerDeriv(y(31),params(8),1)));
g1_v(9)=(-(params(2)*y(21)*y(20)*y(38)*y(33)*y(23)*(1-y(32))));
g1_v(10)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 4);
end
end
