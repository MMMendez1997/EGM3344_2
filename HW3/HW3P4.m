clc;clear

%Variables
cp = 1.1;   %specific heat

%Root finding
a = 0;  %initial guess
iter = 0;   %iteration counter
error = 1;  %initial error
while error > 10^-8 %stopping criterion
    a_prev = a; %previous root updated for next iteration
    f = .99403 + ((1.671*(10^-4))*a) + ((9.7215*(10^-8))*(a^2)) - ((9.5838*(10^-11))*(a^3)) + ((1.952*(10^-14))*(a^4)) - cp;    %using Newton-Raphson method to determine where to place tangent line
    f_1 = ((976*a^3) - (3593925*a^2) + (2430375000*a) + (2088750000000))/(1.25*10^16);  %using Newton-Raphson method to determine where to place tangent line
    a = a - (f/f_1);    %update law
    error = abs((a - a_prev)/a_prev);   %error calculation
    iter = iter+1;  %updated iteration
end

%Plotting
T = 0:100:1200; %x range
f = .99403 + ((1.671*(10^-4))*T) + ((9.7215*(10^-8))*(T.^2)) - ((9.5838*(10^-11))*(T.^3)) + ((1.952*(10^-14))*(T.^4));  %function
hold on
plot(T,f,'k--') %function
plot(0:a,cp,'rx-','markersize',1)  %root indicator
plot(a,.95:.0005:cp,'rx-','markersize',1)  %root indicator
xlabel('Temperature (K)')   %x-axis label
ylabel('Zero Pressure Specific Heat of Dry Air (kJ/(kg K))')    %y-axis label
legend('show','Function','Root','location','southeast') %legend
hold off