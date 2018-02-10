clc;clear

%Variables
xl = .2;    %lower limit
xu = .5;    %upper limit
cp = 1.1;   %specific heat
num = (.99403 + ((1.671*(10^-4))*xu) + ((9.7215*(10^-8))*(xu.^2)) - ((9.5838*(10^-11))*(xu.^3)) + ((1.952*(10^-14))*(xu.^4)) - cp)*(xu-xl); %numerator of root function
den = (.99403 + ((1.671*(10^-4))*xu) + ((9.7215*(10^-8))*(xu.^2)) - ((9.5838*(10^-11))*(xu.^3)) + ((1.952*(10^-14))*(xu.^4)) - cp)-(.99403 + ((1.671*(10^-4))*xl) + ((9.7215*(10^-8))*(xl.^2)) - ((9.5838*(10^-11))*(xl.^3)) + ((1.952*(10^-14))*(xl.^4)) - cp);    %denominator of root function
xm = xu - (num/den);    %approximated root

%Root finding
iter = 0;   %iteration counter
error = 1;  %initial error
while error > 10^-8 %stopping criterion
    if (.99403 + ((1.671*(10^-4))*xl) + ((9.7215*(10^-8))*(xl.^2)) - ((9.5838*(10^-11))*(xl.^3)) + ((1.952*(10^-14))*(xl.^4)) - cp)*(.99403 + ((1.671*(10^-4))*xm) + ((9.7215*(10^-8))*(xm.^2)) - ((9.5838*(10^-11))*(xm.^3)) + ((1.952*(10^-14))*(xm.^4)) - cp) < 0    %using false position method to determine which part of the interval to discard
        xu = xm;    %upper section discarded
    else
        xl = xm;    %lower section discarded
    end
    xm_prev = xm;   %previous root updated for next iteration
    num = (.99403 + ((1.671*(10^-4))*xu) + ((9.7215*(10^-8))*(xu.^2)) - ((9.5838*(10^-11))*(xu.^3)) + ((1.952*(10^-14))*(xu.^4)) - cp)*(xu-xl);
    den = (.99403 + ((1.671*(10^-4))*xu) + ((9.7215*(10^-8))*(xu.^2)) - ((9.5838*(10^-11))*(xu.^3)) + ((1.952*(10^-14))*(xu.^4)) - cp)-(.99403 + ((1.671*(10^-4))*xl) + ((9.7215*(10^-8))*(xl.^2)) - ((9.5838*(10^-11))*(xl.^3)) + ((1.952*(10^-14))*(xl.^4)) - cp);
    xm = xu - (num/den);    %update law
    error = abs((xm-xm_prev)/xm);   %error calculation
    iter = iter + 1;    %update iteration
end

%Plotting
T = 0:100:1200; %x range
f = .99403 + ((1.671*(10^-4))*T) + ((9.7215*(10^-8))*(T.^2)) - ((9.5838*(10^-11))*(T.^3)) + ((1.952*(10^-14))*(T.^4));  %function
hold on
plot(T,f,'k--') %function
plot(0:xm,cp,'rx-','markersize',1)  %root indicator
plot(xm,.95:.0005:cp,'rx-','markersize',1)  %root indicator
xlabel('Temperature (K)')   %x-axis label
ylabel('Zero Pressure Specific Heat of Dry Air (kJ/(kg K))')    %y-axis label
legend('show','Function','Root','location','southeast') %legend
hold off