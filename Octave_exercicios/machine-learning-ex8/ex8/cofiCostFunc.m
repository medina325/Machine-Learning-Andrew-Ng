function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X     - (num_movies x num_features) matrix of movie features
%        Theta - (num_users x num_features) matrix of user features
%        Y     - (num_movies x num_users) matrix of user ratings of movies
%        R     - (num_movies x num_users) matrix, where R(i, j) = 1 if the 
%                i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad     - (num_movies x num_features) matrix, containing the 
%                     partial derivatives w.r.t. to each element of X
%        Theta_grad - (num_users x num_features) matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

% Explanation
% The matrix R has every row representing a movie and every column a user.
% Every row of the matrix Theta represents a user with n feature weights,
% and every row of the matrix X represents a movie with n features.
% So the idea is to use the matrix R as a mask for the X*Theta' matrix, to
% select only those elements where R == 1

previsions = R .* (X * Theta');

% Compute cost without regularization
J = (1/2) * sum(sum((previsions - Y) .^ 2)) + ...
    (lambda/2) * (sum(sum(Theta .^ 2)) + sum(sum(X .^ 2)));

% Compute gradients to feed fmincg optimization package
% Obs.: done purely using matrix size correspondence
X_grad = ((previsions - Y) * Theta) + lambda * X;
Theta_grad = ((previsions - Y)' * X) + lambda * Theta;

% =============================================================

% Unroll 
grad = [X_grad(:); Theta_grad(:)];

end
