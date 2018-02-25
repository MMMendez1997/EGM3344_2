clc;clear

phi = (1+sqrt(5))/2;    %golden ratio
xlow = -10;   %lower limit guess
xu = 0; %upper limit guess
d = .61803*(xu - xlow);   %used to create interior points
x1 = xlow + d;    %interior point 1
x2 = xu - d;    %interior point 2
f1 = @(x1) (x1^2) + (8*x1) - 12; %function evaluated at x1
f2 = @(x2) (x2^2) + (8*x2) - 12;   %function evaluated at x2

iter = 0;   %initial iteration
error = 1;  %initial error
while error > 10^-8 %stopping criterion   
    if f1(x1) < f2(x2) %discard [xlow,x2]
        %update rules
        xopt = x1;  %optimal value
        xlow = x2;  %lowest limit becomes x2
        x2 = x1;    %x2 becomes x1
        d = .61803*(xu - xlow); %interior point constant update
        x1 = xlow + d;  %x1 becomes sum of the lowest limit and d
    else %discard [x1,xu]
        %update rules
        xopt = x2;  %optimal value
        xu = x1;    %upper limit becomes x1
        x1 = x2;    %x1 becomes x2
        d = .61803*(xu - xlow); %interior point constant update
        x2 = xu - d;    %x2 becomes sum ofthe upper limit and d
    end
    error = (2-phi)*abs((xu-xlow)/xopt);    %error calculation
    iter = iter + 1;    %iteration counter
end