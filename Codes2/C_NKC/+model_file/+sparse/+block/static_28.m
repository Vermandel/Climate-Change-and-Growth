function [y, T, residual, g1] = static_28(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(44)=y(1)^(1-params(9));
  residual(1)=(y(46))-(y(2)*T(44)*(1/(1-params(9))*y(43)^(1-params(9))-params(13)/(1+params(10))*T(43))+params(11)*y(46));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1-params(11);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
