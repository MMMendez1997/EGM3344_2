clc;clear
a = pi/2;   %base point
x = 0:.1:pi;    %interval
f = x - 1 - 0.5*sin(x); %function

T_0 = a - 1 - 0.5*sin(a)*((x-a).^0);    %function converted to taylor series
T_1 = T_0 + (1 - 0.5*cos(a))*((x-a).^1);    %first order taylor series, derivative of previous
T_2 = T_1 + ((0.5*sin(a))/factorial(2))*((x-a).^2); %second order taylor series, derivative of previous
T_3 = T_2 + ((0.5*cos(a))/factorial(3))*((x-a).^3); %third order taylor series, derivative of previous
T_4 = T_3 + ((-0.5*sin(a))/factorial(4))*((x-a).^4);    %fourth order taylor series, derivative of previous
T_5 = T_4 + ((-0.5*cos(a))/factorial(5))*((x-a).^5);    %fifth order taylor series, derivative of previous

E_1 = abs(T_1-f);   %error for first order taylor series
E_2 = abs(T_2-f);   %error for second order taylor series
E_3 = abs(T_3-f);   %error for third order taylor series
E_4 = abs(T_4-f);   %error for fourth order taylor series
E_5 = abs(T_5-f);   %error for fifth order taylor series

%Plotting Taylor Series
%Plot along interval
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

%Plotting Error for Taylor Series
%Plot along interval
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