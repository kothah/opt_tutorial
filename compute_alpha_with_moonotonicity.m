function alpha = compute_alpha_with_moonotonicity(x,p,alpha_max,objective)
% computing alpha such that it ensures f(x_new) <= f(x_old)

alpha = alpha_max;

% contraction factor for alpha
rho = 0.5;

% evaluate objective at x_new
f_new = objective(x + alpha*p);
f_old = objective(x);

% TODO : Write the condition for monononicity
while none
  alpha = alpha * rho;
  % update f_new
  f_new = none;
end