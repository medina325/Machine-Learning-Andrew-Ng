function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Let's try using the same set of values for both sigma and C (total of 32 combinations)
sigma_attempts = C_attempts = [0.01 0.03 0.1 0.3 1];

% We need a nested loop for each combination
% Obs.: this is what foreach loops look like in Octave
% Obs.: _C and _sigma is just to differ from C and sigma
min = inf;
for _C = C_attempts
  for _sigma = sigma_attempts
    model = svmTrain(X, y, _C, @(x1, x2) gaussianKernel(x1, x2, _sigma));
    predictions = svmPredict(model, Xval);
    
    % Error in the cross validation set
    errorVal = mean(double(predictions ~= yval));
    if (errorVal < min)
      min = errorVal;
      C = _C;
      sigma = _sigma;
    endif
  endfor
endfor




% =========================================================================

end
