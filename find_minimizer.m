function [x] = find_minimizer(x,objective, gradient, hessian, plotpath)
% to keep track of number of iterations
iter = 0;

% computer gradient at x_0
grad_f = gradient(x);
% hess_f = hessian(x);

% TODO: select a value for alpha
alpha = 0.01;

alpha_max = 1;

% Print the progress
fprintf("Step \t |x_new-x| \t |grad_k| \t alpha\n")

while iter==0 || norm(grad_f) > 1e-6
  iter = iter + 1;
  
  % TODO: use gradient as a descent direction
  p = none;
  
  % TODO: change the gradient descent direction to Newton direction
  % p = none;
  
  % TODO: compute alpha such that it satisfies monotonicity
  % alpha = compute_alpha_with_moonotonicity(x,p,alpha_max,objective);
  
  % TODO: compute a better alpha such that it satisfies first Wolfe condition
  % alpha = compute_alpha_with_first_wolfe(x,p,alpha_max,objective,grad_f);
  
  % update the iterate
  x_new = x + alpha*p;
  
  % evaluate gradient at new iterate
  grad_f = gradient(x_new);
  % hess_f = hessian(x_new);

  % plot the updates
  if plotpath == true
    hold on;
    if numel(x)==1
      plot([x_new, x],[objective(x_new), objective(x)],'r-*','linewidth',2);
    elseif numel(x)==2
      plot([x_new(1), x(1)],[x_new(2), x(2)],'r-*','linewidth',2);
    end
  drawnow
  end
  
  % print progress of iterates
  fprintf("%2d \t %1.3e \t %1.3e \t %1.3e\n",iter,norm(x_new-x),norm(grad_f),alpha);
  
  % replace the old value of x with a new one
  x = x_new;
end
end

