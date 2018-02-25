clc;clear

%Variables
x1 = 10;    %initial value 1
x2 = 2;     %initial value 2
x = [10;2]; %vector of initial values
f = 10*x(1)^2 + 10*x(2)^2;  %function using x1 and x2
dx1 = 20*x(1);  %partial derivative of f WRT x1
dx2 = 20*x(2);  %partial derivative of f WRT x2
grad = [dx1;dx2];   %the gradient is created from dx1 and dx2
hessian = [20;20];  %calculate the hessian
delta = -hessian.^(-1).*grad;  %the delta x is the negative of the gradient

t = 1;  %default starting value of t
iter = 0;   %iteration counter starts at 0
while norm(grad) > 10^-6    %stopping criterion
    xnew = x + t*delta; %xnew is the update rule
    fnew = 10*xnew(1)^2 + 10*xnew(2)^2;   %updated function using updated x
    dx1 = 20*xnew(1);   %save new partial derivatives to update the gradient
    dx2 = 20*xnew(2);   %save new partial derivatives to update the gradient
    grad = [dx1;dx2];   %update gradient
    delta = -hessian.^(-1).*grad;      %update delta
    iter = iter+1;      %update iteration counter
    x = xnew;           %save this iterations x for next iteration
end