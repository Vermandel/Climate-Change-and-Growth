function [ys0_] = histval(oo_, M_)
ys0_ = oo_.steady_state;
oo_.initial_exo_steady_state = oo_.exo_steady_state;
ys0_(1) = M_.params(5);
ys0_(2) = M_.params(22);
ys0_(13) = M_.params(63);
ys0_(3) = M_.params(38);
ys0_(5) = M_.params(40);
ys0_(6) = M_.params(39);
ys0_(15) = M_.params(1);
ys0_(12) = M_.params(23);
ys0_(11) = M_.params(14);
ys0_(8) = M_.params(25);
ys0_(7) = M_.params(28);
ys0_(17) = M_.params(31);
ys0_(20) = M_.params(57);
ys0_(62)=oo_.exo_steady_state(5);
end
