function [J grad] = nnCostFunction(nn_params, ...
                                                       input_layer_size, ...
                                                       hidden_layer_size, ...
                                                       num_labels, ...
                                                       X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

% Para computar h(x) precisamos computar a2
% Primeiro adicionamos os bias para nosso X local dessa função
a1 = X = [ones(size(X, 1), 1) X];

z2 = X * Theta1';
a2 = [ones(m, 1) sigmoid(z2)];

z3 = a2 * Theta2';
h = a3 = sigmoid(z3);

% Mapeando valores de y em uma nova matriz 10x5000 já que devem ser mapeados em vetores coluna
y_mapped = zeros(num_labels, m);
for i = 1:m
  if (y(i) == 0)
    y_mapped(10, i) = 1;
  else
    y_mapped(y(i), i) = 1;
  endif
end

% NAO ESQUEÇA a ideia aqui
% Combinar primeira linha de h com primeira coluna de y
% Combinar segunda linha de h com segunda coluna de y
% E assim por diante, para fazer aquele somatório "duplo"
for i = 1:m
  J += log( h(i, :) ) * y_mapped(:, i) + log(1 - h(i, :) ) * (1 - y_mapped(:, i) );
end
J *= (-1/m);

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%

% d3 will have the errors for each one of the 10 activation units 
% in each of the 10 rows in the corresponding column of one of the 5000 training examples
d3 = a3' - y_mapped;

% d2 follows the same idea as d3, but instead of 10 it has 5000 activation units
d2 =  Theta2(:, 2:end)' * d3  .* sigmoidGradient(z2)';

% With the errors for every activation unit from every layer and every training example
% we can then average it all (that's why Theta2_grad is a (10x26) matrix and Theta1_grad is a (25x401) matrix
Theta2_grad = (1/m) * d3 * a2;
Theta1_grad = (1/m) * d2 * a1;

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% First regularizing the cost
t1 = Theta1(:, 2:end) ;
t2 = Theta2(:, 2:end);
regularization_term = (lambda/(2*m)) * (sum(t1(:) .^ 2) + sum(t2(:) .^ 2));
J += regularization_term;

% And then the gradients
lambda_m = lambda/m;
Theta2_grad(:, 2:end) += lambda_m * Theta2(:, 2:end);
Theta1_grad(:, 2:end) += lambda_m * Theta1(:, 2:end);

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
