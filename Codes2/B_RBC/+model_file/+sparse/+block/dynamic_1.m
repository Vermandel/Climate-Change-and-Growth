function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(22)=y(3)*(1-params(4));
  T(1)=params(3)^params(6);
  y(21)=y(2)^(1-params(6))*T(1);
  y(23)=y(4)*(1-params(27));
  y(25)=y(6)*(1-params(24));
  y(38)=1-params(33)+params(33)*y(19)+x(1);
  y(32)=(params(14)+params(34)*x(2))^(1/(params(22)-1));
  y(34)=params(14)+params(34)*x(2);
  y(20)=y(1)*(1+y(3));
  y(24)=max(y(23)*params(23)/1000/params(22)*y(25),0);
  y(37)=1000*y(24)*y(34)/(y(23)+1e-8);
end
