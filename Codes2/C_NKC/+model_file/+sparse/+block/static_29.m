function [y, T, residual, g1] = static_29(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  residual(1)=(y(45))-(y(2)*y(24)*T(44)*(1/(1-params(9))*y(27)^(1-params(9))-params(13)/(1+params(10))*(y(32)/(1-params(18)))^(1+params(10)))+y(2)*T(44)*params(53)*(y(13)-y(17))^2+params(11)*y(45));
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
