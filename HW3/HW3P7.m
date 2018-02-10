clc;clear

%First root finding
iter1 = 0;  %iteration counter
error = 1;  %initial error
while error > 10^-8 %stopping criterion
    if iter1 == 0   %initial iteration guesses
        a_prev = 2; %initial root guess
        a = 6;  %initial+1 root guess
    else  %update previous and current root approximation
        a_prev = a; %a becomes a-1
        a = a_next; %a+1 becomes a
    end
    num = ((exp(-.5*a))*(4-a)-2)*(a_prev-a);    %numerator for function
    den = ((exp(-.5*a_prev))*(4-a_prev)-2)-((exp(-.5*a))*(4-a)-2);  %denominator for function
    a_next = a-(num/den);   %update law
    iter1 = iter1+1;    %update itertion
    error = abs((a_next-a)/a);  %error calculation
end
a1 = a_next;

%Second root finding
iter2 = 0;
error = 1;
while error > 10^-8
    if iter2 == 0
        a_prev = 2;
        a = 8;
    else
        a_prev = a;
        a = a_next;
    end
    num = ((exp(-.5*a))*(4-a)-2)*(a_prev-a);
    den = ((exp(-.5*a_prev))*(4-a_prev)-2)-((exp(-.5*a))*(4-a)-2);
    a_next = a - (num/den);
    iter2 = iter2+1;
    error = abs((a_next-a)/a);
end
a2 = a_next;

%Third root finding
iter3 = 0;
error = 1;
while error > 10^-8
    if iter3 == 0
        a_prev = 6;
        a = 8;
    else
        a_prev = a;
        a = a_next;
    end
    num = ((exp(-.5*a))*(4-a)-2)*(a_prev-a);
    den = ((exp(-.5*a_prev))*(4-a_prev)-2)-((exp(-.5*a))*(4-a)-2);
    a_next = a - (num/den);
    iter3 = iter3+1;
    error = abs((a_next-a)/a);
end
a3 = a_next;

%Plotting
x = 0:.01:10;   %x range
f = (exp(-.5.*x)).*(4-x)-2; %function
hold on
plot(x,f,'k--') %function
plot(x,0,'r-x','markersize',1)  %zero line
plot(a1,-20:.1:0,'b-x','markersize',1)  %root 1 indicator
plot(a2,-20:.1:0,'m-x','markersize',1)  %root 2 indicator
plot(a3,-20:.1:0,'g-x','markersize',1)  %root 3 indicator
xlabel('x-values')  %x axis label
ylabel('f(x)')  %y axis label
legend('show','Function','Zero','Root 1','Root 2','Root 3') %legend