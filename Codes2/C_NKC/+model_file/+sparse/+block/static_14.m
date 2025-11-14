function [y, T] = static_14(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(7)=max(y(5)*params(34)/1000/params(33)*y(8),0);
  T(2)=y(26)^params(33);
  y(30)=y(7)*params(54)*100*T(2);
  y(31)=1000*y(7)*params(54)*y(34)/(y(5)+1e-8);
  T(3)=(params(24)+params(56)*x(5))^(1/(params(33)-1));
  T(4)=params(33)+T(3)*(1-params(33));
  y(56)=y(7)*params(54)*(params(24)+params(56)*x(5))*T(4)*100/params(66);
end
