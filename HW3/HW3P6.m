clc;clear

a = 2;
iter1 = 0;
error = 1;
while error > 10^-8
    a_prev = a;
    a = a - ((exp(-.5.*a)).*(4-a)-2)/(((a-6).*exp(-a/2))/2);
    error = abs((a - a_prev)/a_prev);
    iter1 = iter1 + 1;
end
a1 = a;

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

x = 0:.01:10;
f = (exp(-.5.*x)).*(4-x)-2;
f_1 = ((x-6).*exp(-x/2))/2;

hold on
plot(x,f,'k--')
plot(x,0,'r-x','markersize',1)
plot(a1,-20:.1:0,'b-x','markersize',1)
plot(a2,-20:.1:0,'m-x','markersize',1)
plot(a3,-20:.1:0,'g-x','markersize',1)
xlabel('x-values')
ylabel('f(x)')
legend('show','Function','Zero','Root 1','Root 2','Root 3')