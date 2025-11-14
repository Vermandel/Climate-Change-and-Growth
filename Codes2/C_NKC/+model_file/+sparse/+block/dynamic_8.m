function [y, T] = dynamic_8(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(120)=(y(73)-y(82))*100-y(123)-y(121)-y(122);
  y(119)=y(123)+y(120)+y(121)+y(122);
  y(106)=T(7)*params(13)*((y(75)/T(11))^(1/params(12))/(1-params(18)))^params(10);
  y(95)=T(11);
end
