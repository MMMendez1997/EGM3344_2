clc;clear

%x-values
x = sqrt(10);
% x = 1337;
% x = 666;

f = @(x) x^2 + 8*x - 12; %function calculated at x
f1 = @(x) 2*x + 8; %first derivative of function calculated at x

iter = 0;   %initial iteration
while abs(f1(x)) > 10^-6
    x = x - (f(x)/f1(x)); %update rule
    iter = iter + 1;    %iteration counter
end