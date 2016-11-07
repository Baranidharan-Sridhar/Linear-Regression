function [theta, J_old] = gradientDescent(X, y, alpha, numberOfIterations, theta)

m = length(y); 
J_old = zeros(numberOfIterations, 1); 

for iteration = 1:numberOfIterations
    
    hypothesis = X * theta;
    errors = hypothesis .- y;
    newDecrement = (alpha * (1/m) * errors' * X); 
    theta = theta - newDecrement';
    J_old(iteration) = cost(X, y, theta);

end
end