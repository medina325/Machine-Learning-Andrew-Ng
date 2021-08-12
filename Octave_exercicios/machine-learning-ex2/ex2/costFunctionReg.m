function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% Same drill as before, just need to add the regularization term
h = sigmoid(X*theta);
regularization_term = (lambda/(2*m)) * sum(theta(2:size(theta,1),:) .^ 2);

J = -(1/m) * (y' * log(h) + (1-y)' * log(1-h)) + regularization_term;

% Every grad has this derivative term
grad = (1/m) * (X' * (h-y));

% But the first one doesn't have the regularization term added to it
grad(2:size(grad,1)) += (lambda/m) * theta(2:size(theta,1),:);

% =============================================================

end