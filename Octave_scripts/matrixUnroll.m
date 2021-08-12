# Suppose you have three Theta matrices for your 4 layer neural network

Theta1 = ones(10, 20);
Theta2 = 2*ones(10,20);
Theta3 = 3*ones(1,20);

# In order to use fminunc the theta parameter needs to be a vectorize
# So you just unroll every matrix in form of vectors like so
thetaVec = [ Theta1(:); Theta2(:); Theta3(:); ];

# The same goes to the D matrices for backpropagation

