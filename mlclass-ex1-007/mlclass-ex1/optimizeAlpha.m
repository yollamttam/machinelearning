function optimizeAlpha()

data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);
[X mu sigma] = featureNormalize(X);
X = [ones(m, 1) X];

alpha = 0.01;
num_iters = 50;

figure;
xlabel('Number of iterations');
ylabel('Cost J');

alphaarray = logspace(-3,1,10);
for i = 1:length(alphaarray)

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[shit, J_history] = gradientDescentMulti(X, y, theta, alphaarray(i), num_iters);
titles = sprintf('\alpha = %d',alphaarray(i));
title(titles);
hold on; plot(1:numel(J_history),J_history,'-b','Linewidth',2);

pause;
end












end