clear ; close all; clc

%CHANGE THE ORDER OF POLYNOMIAL BELOW, TO 1, 2, 3 OR 4.

orderOfThePolynomial=4;

%LOAD TEST AND TRAINING DATA BELOW ::

data = load('training.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

test_data = load('test.m');
testX = test_data(:, 1:2);
test_y = test_data(:, 3);



[X mu sigma] = featureNormalize(X);

X= orderX(X,orderOfThePolynomial);

X = [ones(m, 1) X];

alpha = 0.01;
num_iters = 500;

theta = zeros(1+(orderOfThePolynomial+orderOfThePolynomial),1);

[theta, J_old] = gradientDescent(X, y, alpha, num_iters, theta);



hold on;
for i=1: size(testX)
  normalizedx1 = (testX(i,1) - mu) / sigma;
  normalizedx2 = (testX(i,2) - mu) / sigma;

  nI = [normalizedx1 normalizedx2];
  xTarget= orderX (nI,orderOfThePolynomial);

  normalizedInput = [1 xTarget];
  est = normalizedInput * theta; 

  fprintf(['Prediction using gradient descent): $%f'], est);
  fprintf(['  Error claculation: : $%f\n'], test_y(i,:)-est);
  scatter ((normalizedx1+normalizedx2)/2,est,"b");
 endfor
notationY= reshape(y,1,m)  ;

% plot(X(:,2), notationY);

 scatter(X(:,2),notationY,"r");
 scatter(X(:,3),notationY,"r");
 
 
 hold off;