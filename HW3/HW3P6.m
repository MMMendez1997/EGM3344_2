clc;clear

%First root finding
a = 2;  %initial guess
iter1 = 0;  %iteration counter
error = 1;  %initial error
while error > 10^-8 %stopping criterion
    a_prev = a; %previous root updated for next iteration
    a = a - ((exp(-.5.*a)).*(4-a)-2)/(((a-6).*exp(-a/2))/2);    %using Newton-Raphson method to determine where to place tangent line
    error = abs((a - a_prev)/a_prev);   %error calculation
    iter1 = iter1 + 1;  %update iteration
end
a1 = a; %save root

%Second root finding
a = 6;
iter2 = 0;
error = 1;
while error > 10^-8
    a_prev = a;
    a = a - ((exp(-.5.*a)).*(4-a)-2)/(((a-6).*exp(-a/2))/2);
    error = abs((a - a_prev)/a_prev);
    iter2 = iter2 + 1;
end
a2 = a;

%Third root finding
a = 8;
iter3 = 0;
error = 1;
while error > 10^-8
    a_prev = a;
    a = a - ((exp(-.5.*a)).*(4-a)-2)/(((a-6).*exp(-a/2))/2);
    error = abs((a - a_prev)/a_prev);
    iter3 = iter3 + 1;
end
a3 = a;

%Plotting
x = 0:.01:10;   %x range
f = (exp(-.5.*x)).*(4-x)-2; %function
f_1 = ((x-6).*exp(-x/2))/2; %function first derivative
hold on
plot(x,f,'k--') %function
plot(x,0,'r-x','markersize',1)  %zero line
plot(a1,-20:.1:0,'b-x','markersize',1)  %first root indicator
plot(a2,-20:.1:0,'m-x','markersize',1)  %second root indciator
plot(a3,-20:.1:0,'g-x','markersize',1)  %third root indicator
xlabel('x-values')  %x axis label
ylabel('f(x)')  %y axis label
legend('show','Function','Zero','Root 1','Root 2','Root 3') %legend