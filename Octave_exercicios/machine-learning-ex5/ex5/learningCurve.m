function [error_train, error_val, error_test] = ...
    learningCurve(X, y, Xval, yval, Xtest, ytest, lambda)
%LEARNINGCURVE Generates the train, cross validation and test set errors needed 
%to plot a learning curve
%   [error_train, error_val, error_test] = ...
%       LEARNINGCURVE(X, y, Xval, yval, Xtest, ytest, lambda) returns the train,
%       cross validation and test set errors for a learning curve. In particular, 
%       it returns two vectors of the same length - error_train, 
%       error_val and error_test. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i) and error_test(i)).
%
%   In this function, you will compute the train, cross validation and test errors for
%   dataset sizes from 1 up to m. In practice, when working with larger
%   datasets, you might want to do this in larger intervals.
%

% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);
error_test = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the cross validation errors in error_val. 
%               i.e., error_train(i) and 
%               error_val(i) should give you the errors
%               obtained after training on i examples.
%
% Note: You should evaluate the training error on the first i training
%       examples (i.e., X(1:i, :) and y(1:i)).
%
%       For the cross-validation error, you should instead evaluate on
%       the _entire_ cross validation set (Xval and yval).
%
% Note: If you are using your cost function (linearRegCostFunction)
%       to compute the training and cross validation error, you should 
%       call the function with the lambda argument set to 0. 
%       Do note that you will still need to use lambda when running
%       the training to obtain the theta parameters.
%

% ---------------------- Sample Solution ----------------------

for i = 1:m
  % First we train the model (learn theta) with the subset of the first i examples
  theta = trainLinearReg(X(1:i, :), y(1:i, :), lambda);
            
  % Next we compute the train error with theta learned (remember to only use the examples used to train the model)
  error_train(i) = linearRegCostFunction(X(1:i, :), y(1:i, :), theta, 0);  % Note lambda = 0 being passed as argument
  
  % Then we compute the cross validation error with the theta learned (remember to use the entire VALIDATION SET)
  error_val(i) = linearRegCostFunction(Xval, yval, theta, 0);  
  
  % At last, we compute the test error with the theta learned (using the entire TEST SET)
  % This is interesting because the test data was never used before (unlike the training and cross validation data)
  error_test(i) = linearRegCostFunction(Xtest, ytest, theta, 0);
  
end

% -------------------------------------------------------------

% =========================================================================

end
