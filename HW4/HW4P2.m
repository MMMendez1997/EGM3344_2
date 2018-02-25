clc;clear

%x-values
x = sqrt(10);
% x = 1337;
% x = 666;

f1 = @(x) 2*x + 8; %first derivative of function calculated at x
f2 = @(x) 2; %second derivative of function calculated at x

iter = 0;   %initial iteration
while abs(f1(x)) > 10^-6
    x = x - (f1(x)/f2(x)); %update rule
    iter = iter + 1;    %iteration counter
end