%HW1Q5
clc;clear

%Variables
k = .175;           %constant (days^-1)
delt = .1;          %step size (days)
t = (0:delt:1)';       %time vector, interval of delt
c = nan(size(t));   %empty concentration vector 
c(1) = 100;         %initial concentration

%Euler's Method
for ii = 1:length(t)-1
    dcdt = -k*c(ii);                    %compute current mass
    c(ii + 1) = c(ii) + dcdt*delt;      %update law
end
[t c]                                   %combining vectors for ease of view in output
diff(t)./diff(log(c))                   %slope between each point

%Graphing
figure
plot(t,log(c),'b.-','markersize',20,'linewidth',2,'DisplayName','Simulated Concentration')
xlabel('t (days)')
ylabel('ln(c) (log-Bq/L)')
legend('show')