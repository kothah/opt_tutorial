function alpha = compute_alpha_with_first_wolfe(x,p,alpha_max,objective,grad_f)
% computing alpha such that it ensures f(x_new) <= f(x_old)

alpha = alpha_max;

% contraction factor for alpha
rho = 0.5;

% TODO: try different values of c1, where 0 < c1 < 1
c1 = 1e-4;

% evaluate objective at x_new
f_new = objective(x + alpha*p);
f_old = objective(x);

% TODO: Use the first Wolfe condition
while none
  alpha = alpha * rho;
  
  % update f_new
  f_new = objective(none);
end