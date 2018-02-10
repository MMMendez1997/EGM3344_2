clc;clear

iter1 = 0;
error = 1;
while error > 10^-8
    if iter1 == 0
        a_prev = 2;
        a = 6;
    else
        a_prev = a;
        a = a_next;
    end
    num = ((exp(-.5*a))*(4-a)-2)*(a_prev-a);
    den = ((exp(-.5*a_prev))*(4-a_prev)-2)-((exp(-.5*a))*(4-a)-2);
    a_next = a-(num/den);
    iter1 = iter1+1;
    error = abs((a_next-a)/a);
end
a1 = a_next;

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

x = 0:.01:10;
f = (exp(-.5.*x)).*(4-x)-2;

hold on
plot(x,f,'k--')
plot(x,0,'r-x','markersize',1)
plot(a1,-20:.1:0,'b-x','markersize',1)
plot(a2,-20:.1:0,'m-x','markersize',1)
plot(a3,-20:.1:0,'g-x','markersize',1)
xlabel('x-values')
ylabel('f(x)')
legend('show','Function','Zero','Root 1','Root 2','Root 3')