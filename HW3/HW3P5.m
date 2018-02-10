clc;clear

%First root finding
a = 4.5;    %initial guess
iter1 = 0;  %iteration counter
error = 1;  %initial error
while error > 10^-8 %stopping criterion
    a_prev = a; %previous root updated for next iteration
    a = a - (-2+(6*a)-(4*(a^2))+(.5*(a^3)))/(6-(8*a)+(1.5*(a^2)));  %using Newton-Raphson method to determine where to place tangent line
    error = abs((a - a_prev)/a_prev);   %error calculation
    iter1 = iter1+1;    %iteration update
end
a1 = a; %save root

%Second root finding
a = 4.43;
iter2 = 0;
error = 1;
while error > 10^-8
    a_prev = a;
    a = a - (-2+(6*a)-(4*(a^2))+(.5*(a^3)))/(6-(8*a)+(1.5*(a^2)));
    error = abs((a - a_prev)/a_prev);
    iter2 = iter2+1;
end
a2 = a;

%Plotting
x = 0:.01:10;   %x range
f = -2+(6.*x)-(4.*(x.^2))+(.5.*(x.^3)); %function
% f_1 = 6-(8.*x)+(1.5.*(x.^2)); %function first derivative
hold on
plot(x,f,'k--') %function
plot(x,0,'r-x','markersize',1)  %zero line
plot(a1,-20:.1:0,'b-x','markersize',1)  %root 1 indicator
plot(a2,-20:.1:0,'m-x','markersize',1)  %root 2 indicator
xlabel('x-values')  %x axis label
ylabel('f(x)')  %y axis label
legend('show','Function','Zero','Root 1','Root 2')  %legend
hold off