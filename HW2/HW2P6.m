clc;clear
a = pi/2;
x = 0:.1:pi;
f = x - 1 - 0.5*sin(x);

T_0 = a - 1 - 0.5*sin(a)*((x-a).^0);
T_1 = T_0 + (1 - 0.5*cos(a))*((x-a).^1);
T_2 = T_1 + ((0.5*sin(a))/factorial(2))*((x-a).^2);
T_3 = T_2 + ((0.5*cos(a))/factorial(3))*((x-a).^3);
T_4 = T_3 + ((-0.5*sin(a))/factorial(4))*((x-a).^4);
T_5 = T_4 + ((-0.5*cos(a))/factorial(5))*((x-a).^5);

E_1 = abs(T_1-f);
E_2 = abs(T_2-f);
E_3 = abs(T_3-f);
E_4 = abs(T_4-f);
E_5 = abs(T_5-f);

hold on
plot(x,f,'k*-')
plot(x,T_1,'r.-')
plot(x,T_2,'bo-')
plot(x,T_3,'g--')
plot(x,T_4,'cx-')
plot(x,T_5,'ms-')
xlabel('x-values (radians)')
ylabel('sine')
legend('show','Analytical','First Order','Second Order','Third Order','Fourth Order','Fifth Order','location','southeast')
hold off

figure
hold on 
plot(x,E_1,'r.-')
plot(x,E_2,'b:')
plot(x,E_3,'g--')
plot(x,E_4,'cx-')
plot(x,E_5,'ms-')
xlabel('x-values (radians)')
ylabel('error')
legend('show','First Order Error','Second Order Error','Third Order Errorr','Fourth Order Error','Fifth Order Error')
hold off