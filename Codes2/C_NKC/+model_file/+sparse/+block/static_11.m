function [y, T] = static_11(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(9)=log((1+y(3))*(1+y(4)));
  y(34)=params(24)+params(56)*x(5);
  y(26)=(y(25)*(params(24)+params(56)*x(5)))^(1/(params(33)-1));
  y(62)=x(5);
end
