close all;
clear all;
clc

problem_num = 2;
plot_progress = true;

switch problem_num
  case 1
    %% (1) quadratic function
    objective = @(x) (5+x).^2;
    % TODO: compute gradient/hessian of the objective function
    gradient = @(x) none;
    hessian = @(x) none;

    % Plot the given objective function
    xrange= (-20:0.1:20);
    plot(xrange, objective(xrange),'linewidth',2);
    
    % TODO: Try different values for initial Guess
    %         Does choice matter?
    x_guess = none;
      
  case 2
    %% (2) non-convex function
    objective = @(x) (x - 2).*x.*(x + 2.0).^2;
    
    % TODO: compute gradient/hessian of the objective function
    gradient = @(x) none;
    hessian = @(x) none;

    % Plot the given objective function
    xrange = (-3:0.1:2.3);
    plot(xrange, objective(xrange),'linewidth',2);
    
    % TODO: Try different values for initial Guess
    %         Does choice matter?
    x_guess = -3;
        
  case 3
    %% (3) non-convex function, highly oscillating 
    objective = @(x) -x.*sin(x);
    % TODO: compute gradient/hessian of the objective function
    gradient = @(x) none;
    hessian = @(x) none;
    
    % Plot the given objective function    
    xrange= (-1:0.1:11);    
    plot(xrange, objective(xrange),'linewidth',2);
    
    % TODO: Try different values for initial guess 
    %         Does choice matter?
    x_guess = 4;    
end

% TODO: Try different values for alpha e.g., 0.1, 0.5, 0.9, 1.
%         Does the choice matter?

% TODO: Use explicit formula for optimal alpha
%         (note that all objective function are not quadratic)

% TODO: Consider other termination criterions for the algorithm
x_min = find_minimizer(x_guess, objective, gradient, hessian, plot_progress);
