clear all;
close all;
clc

problem_num = 1;
plot_progress = true;

switch problem_num
  case 1
    %% (1) quadratic function
    objective = @(x) x(1).^2 + 10*x(2).^2;

    % TODO: compute gradient/hessian of the objective function
    gradient = @(x) none;
    hessian = @(x) none;

    % for plotting the contours
    x = (-5:0.1:5);
    y = (-5:0.1:5);
    [X,Y] = meshgrid(x,y);
    Z =  X.^2 + 10*Y.^2;
    contour(X,Y,log2(10+Z),50,'LineWidth',2);
    axis equal

    % TODO: Try different values for initial Guess
    x_guess = [5; 5];

  case 2
    %% (2) a convex funciton
    % Beale function
    % min f(x,y) = (x*y^2 - x + 9/4)^2 + (x*y^3 - x + 21/8)^2 + (x*y - x + 3/2)^2^2
    % choose -4.5 < x,y < 4.5
    x = (-4.5:0.05:4.5);
    y = (-4.5:0.05:4.5);
    [X,Y] = meshgrid(x,y);
    Z =  (X.*Y.^2 - Y + 9/4)^2 + (X.*Y.^3 - X + 21/8)^2 + (X.*Y - Y + 3/2)^2;
    contour(X,Y,log2(Z+4e7),500,'LineWidth',2);
    axis equal


    % TODO: compute gradient/hessian of the objective function
    objective = @(x) (1.5 -x(1) + x(1)*x(2))^2 + (2.25 - x(1) + x(1)*x(2)^2)^2 + (2.625-x(1) + x(1)*x(2)^3)^2;
    gradient = @(x) [2*(x(2)^2 - 1)*(x(1)*x(2)^2 - x(1) + 9/4) + 2*(x(2)^3 - 1)*(x(1)*x(2)^3 - x(1) + 21/8) + 2*(x(2) - 1)*(x(1)*x(2) - x(1) + 3/2);
      2*x(1)*(x(1)*x(2) - x(1) + 3/2) + 4*x(1)*x(2)*(x(1)*x(2)^2 - x(1) + 9/4) + 6*x(1)*x(2)^2*(x(1)*x(2)^3 - x(1) + 21/8)];
    hessian = @(x) [                                                                           2*(x(2) - 1)^2 + 2*(x(2)^2 - 1)^2 + 2*(x(2)^3 - 1)^2, 6*x(2)^2*(x(1)*x(2)^3 - x(1) + 21/8) - 2*x(1) + 2*x(1)*x(2) + 2*x(1)*(x(2) - 1) + 4*x(2)*(x(1)*x(2)^2 - x(1) + 9/4) + 4*x(1)*x(2)*(x(2)^2 - 1) + 6*x(1)*x(2)^2*(x(2)^3 - 1) + 3;
      6*x(2)^2*(x(1)*x(2)^3 - x(1) + 21/8) - 2*x(1) + 2*x(1)*x(2) + 2*x(1)*(x(2) - 1) + 4*x(2)*(x(1)*x(2)^2 - x(1) + 9/4) + 4*x(1)*x(2)*(x(2)^2 - 1) + 6*x(1)*x(2)^2*(x(2)^3 - 1) + 3,                                     8*x(1)^2*x(2)^2 + 18*x(1)^2*x(2)^4 + 4*x(1)*(x(1)*x(2)^2 - x(1) + 9/4) + 2*x(1)^2 + 12*x(1)*x(2)*(x(1)*x(2)^3 - x(1) + 21/8)];

    % TODO: plot the contours for given objective function
    %         check the case 3 for inspiration

    % TODO: Try different values for initial Guess
    x_guess = [2;2];

  case 3
    %% (3) a non-convex function
    % min f(x,y) = (x^2 + y - 11)^2 + (x + y^2 - 7)^2
    % choose -5 < x,y < 5

    % for plotting the contours
    x = (-5:0.1:5);
    y = (-5:0.1:5);
    [X,Y] = meshgrid(x,y);
    Z =  (X+Y.^2 -7).^2 + (X.^2 + Y - 11).^2;
    contour(X,Y,log2(10+Z),50);
    axis equal

    % TODO: compute gradient/hessian of the objective function
    objective = @(x) (x(2)^2 + x(1) - 7)^2 + (x(1)^2 + x(2) - 11)^2;
    gradient = @(x) none;
    hessian = @(x) none;

    % TODO: Try different values for initial guess
    %         Does choice matter?
    x_guess = [5; 5];

    % TODO: find all minima
  case 4
    % TODO: Add another example: Rosenbroc function in 2D
    % f(x,y) = (1-x)^2 + 100(y-x^2)^2
    objective = @(x) (1-x(1))^2 + 100*(x(2) -x(1)^2)^2;

    gradient = @(x) [2*x(1) - 400*x(1)*(- x(1)^2 + x(2)) - 2;
      - 200*x(1)^2 + 200*x(2)];

    hessian = @(x) [1200*x^2 - 400*y + 2  ,  -400*x;
      -400*x                 ,   200];

    % for plotting the contours
    x = (-2:0.01:2);
    y = (-2:0.01:5);
    [X,Y] = meshgrid(x,y);
    Z =  (1-X).^2 + 100*(Y -X.^2).^2;
    contour(X,Y,log2(10+Z),50,'LineWidth',2);
    axis equal

    x_guess = [-1; -1];

end

% TODO: Try different values for alpha e.g., 0.1, 0.5, 0.9, 1.
%         Does the choice matter?

% TODO: Use explicit formula for optimal alpha
%         (note that all objective function are not quadratic)

% TODO: Consider other termination criterions for the algorithm

x_min = find_minimizer(x_guess, objective, gradient, hessian, plot_progress);