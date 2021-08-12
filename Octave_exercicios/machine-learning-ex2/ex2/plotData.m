function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% First we find the indexes of all y elements that are equal to 1 and 0
index_y0 = find(y == 0);
index_y1 = find(y == 1);

% Then, we create a X array with only those rows where y == 0 and another
% for y == 1
X_y0 = X(index_y0, :);
X_y1 = X(index_y1, :); 

% Now we plot them separately
plot(X_y1(:,1), X_y1(:,2), "k+", "MarkerSize", 7, "LineWidth", 2);
plot(X_y0(:,1), X_y0(:,2), "ko", "MarkerSize", 7, 'LineWidth', 2, 'MarkerFaceColor', 'y');

xlabel('Exam 1 score');
ylabel('Exam 2 score');
legend('Admitted', 'Not admitted');

% =========================================================================

hold off;

end
