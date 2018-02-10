clc;clear

a = 4.5;
iteration1 = 0;
error = 1;
while error > 10^-8
    a_prev = a;
    a = a - (-2+(6*a)-(4*(a^2))+(.5*(a^3)))/(6-(8*a)+(1.5*(a^2)));
    error = abs((a - a_prev)/a_prev);
    iteration1 = iteration1+1;
end
a1 = a;

a = 4.43;
iteration2 = 0;
error = 1;
while error > 10^-8
    a_prev = a;
    a = a - (-2+(6*a)-(4*(a^2))+(.5*(a^3)))/(6-(8*a)+(1.5*(a^2)));
    error = abs((a - a_prev)/a_prev);
    iteration2 = iteration2+1;
end
a2 = a;

x = 0:.01:10;
f = -2+(6.*x)-(4.*(x.^2))+(.5.*(x.^3));
% f_1 = 6-(8.*x)+(1.5.*(x.^2));

hold on
plot(x,f,'k--')
plot(x,0,'r-x','markersize',1)
plot(a1,-20:.1:0,'b-x','markersize',1)
plot(a2,-20:.1:0,'m-x','markersize',1)
xlabel('x-values')
ylabel('f(x)')
legend('show','Function','Zero','Root 1','Root 2')