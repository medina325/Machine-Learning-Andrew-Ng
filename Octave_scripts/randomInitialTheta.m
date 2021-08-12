% For gradient descent we need an initial value of theta, the same applies
% to neural networks, our initial L-1 theta matrices need to be initialized with
% some value. However, unlike before, it cannot be a matrix full of zeros or
% filled up with the same number, this is because all weights are the same, then
% all activation values are going to be the same and the neural network WON'T
% learn (even worse if all the weights are 0 since all activation value would be
% 0 as well). 
%So an alternative to initialize our theta matrices can something like this:

% - Initialize theta matrices with values in a particular range of [-epsilon, epsilon] -
theta1 = rand(10, 11) * (2*INIT_EPSILON) - INIT_EPSILON;
theta2 = rand(1, 11) * (2*INIT_EPSILON) - INIT_EPSILON; 