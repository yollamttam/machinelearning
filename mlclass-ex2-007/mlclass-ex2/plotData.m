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

xAdmitted = X(y==1,:);
xDenied = X(y==0,:);

figure; 
plot(xAdmitted(:,1),xAdmitted(:,2),'+','Color','black','MarkerSize',7);
hold on; 
plot(xDenied(:,1),xDenied(:,2),'o','MarkerFaceColor','yellow','MarkerEdgeColor','black','MarkerSize',7);

%apparently, we don't need this
%legend('Admitted','Not Admitted');
%xlabel('Exam 1 score'); 
%ylabel('Exam 2 score');





% =========================================================================



hold off;

end
