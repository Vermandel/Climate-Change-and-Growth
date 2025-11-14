function [y, T] = dynamic_13(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  T(47)=y(63)^(1-params(9));
  T(48)=params(52)*(y(74)/y(12)-1)^2;
  y(108)=y(64)*T(47)*(1/(1-params(9))*y(105)^(1-params(9))-params(13)/(1+params(10))*((y(79)/y(95))^(1/params(12))/(1-params(18)))^(1+params(10)))-T(48)+params(11)*y(170);
  y(107)=y(64)*y(86)*T(47)*(1/(1-params(9))*y(89)^(1-params(9))-params(13)/(1+params(10))*(y(94)/(1-params(18)))^(1+params(10)))-T(48)+y(64)*T(47)*params(53)*(y(75)-y(79))^2+params(11)*y(169);
end
