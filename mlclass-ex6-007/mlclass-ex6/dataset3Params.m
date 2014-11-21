function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
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

cArray = [.01 .03 .1 .3 1 3 10 30];
sigmaArray = [.01 .03 .1 .3 1 3 10 30];
accuracyGrid = zeros(length(cArray),length(sigmaArray));
maxAccuracy = -100;
maxC = -100;
maxSigma = -100;
for i = 1:length(cArray)
  for j = 1:length(sigmaArray)
    Ctest = cArray(i); 
    sigmatest = sigmaArray(j);
    
    %probably need to use this
    model= svmTrain(X, y, Ctest, @(x1, x2) gaussianKernel(x1, x2, sigmatest)); 
    %visualizeBoundary(X, y, model);
    %need to find the cross-validation error here...
    pred = svmPredict(model,Xval);
    accuracy = mean(double(pred==yval));
    if (accuracy > maxAccuracy)
      maxAccuracy = accuracy;
      maxC = Ctest;
      maxSigma = sigmatest;
    end
    accuracyGrid(i,j) = accuracy;
  end
end

C = maxC;
sigma = maxSigma;

figure; mesh(accuracyGrid); view(2); colorbar;

% =========================================================================

end
