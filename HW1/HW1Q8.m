%HW1Q8
clc;clear

%Variables Part A
delt = .5;                  %step size (hours)
t = (0:delt:5)';            %time vector (hours)
k = .12;                    %constant (hours^-1)
T = nan(size(t));           %empty vector (celsius)
T(1) = 37;                  %body temperature at time of death (celsius)
Ta = 10;                    %ambient temperature of room (celsius)

%Euler's Method Part A
for ii = 1:length(t)-1
    dTdt = -k*(T(ii) - Ta);     %change in body temperature over time
    T(ii+1) = T(ii) + delt*dTdt;     %updated temperature
end
[t T]

%Variables Part B
t2 = (0:delt:5)';              %refer to notes in Part A
T2 = nan(size(t));
T2(1) = 37;
Ta2 = nan(size(t));
Ta2(1) = 20;

%Euler's Method Part B
for ii = 1:length(t)-1
    dTdt2 = -k*(T2(ii) - Ta2(ii));
    T2(ii+1) = T2(ii) + delt*dTdt2;
    Ta2(ii+1) = Ta2(ii) - 1;    %updated ambient temperature 
end
[t T2] 

%Graphing
figure
hold on
plot(t,T,'b.-','markersize',20,'linewidth',2,'DisplayName','Simulated Temperature with Constant Ambient Temperature')
plot(t,T2,'m.-','markersize',20,'linewidth',2,'DisplayName','Simulated Temperature with Varying Ambient Temperature')
xlabel('t (seconds)')
ylabel('T (Celsius)')
legend('show')