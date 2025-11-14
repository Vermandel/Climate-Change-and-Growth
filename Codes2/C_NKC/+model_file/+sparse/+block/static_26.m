function [y, T, residual, g1] = static_26(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(43)=((y(17)/y(33))^(1/params(12))/(1-params(18)))^(1+params(10));
  residual(1)=(y(48))-(params(11)*(T(42)*y(48)+T(43)*y(2)*y(1)*params(13)*params(32)*272.7272727272727/params(12)*y(43)^params(9)));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1-params(11)*T(42);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
