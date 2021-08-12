function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

% Calculating means of each column and storing them in the mu row vector
for iter = 1:size(mu,2)
  mu(iter) = mean(X(:,iter));
end

% Calculating the standard deviation for each column and storing them in the
% zeros row vector
for iter = 1:size(sigma,2)
  sigma(iter) = std(X(:,iter));
end

% Calculating new normalized values of X
X_norm = X - mu; % subtract first ("column wise")
% And divide "column wise"
for iter = 1:size(X_norm,2)
  X_norm(:,iter) = X_norm(:,iter) / sigma(iter);
end
% ============================================================

end
