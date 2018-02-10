% HW1Q7
clc;clear

%Variables
m = 68.1;               %skydivers mass (kg)
cd = 0.25;              %drag coefficient (kg/m)
r = 6.37 * 10^6;        %earth's radius (m)
term_vel = sqrt(9.81*m/cd);     %terminal velocity (m/s)
delt = .1;              %step size (s)
t = (0:delt:5000)';     %time vector, interval of delt (s)   
v = nan(size(t));       %empty vector, velocity (m/s)
v(1) = 0;               %initial velocity (m/s)
v2 = nan(size(t));      %empty vector, velocity (m/s)
v2(1) = 0;              %initial velocity (m/s)
d = nan(size(t));       %empty vector, elevation (m)
d(1) = 100000;          %initial elevation (m)

%Euler's Method
for ii = 1:length(t)-1
    %Velocity with updated gravity
    g = (9.81*(r^2))/((r + d(ii))^2);       %current gravity
    dvdt = g - cd/m*v(ii)^2;                %skydivers current acceleration with updated gravity
    v(ii+1) = v(ii) + dvdt*delt;            %updated velocity with updated gravity
    dd = v(ii)*delt;                        %delta elevation
    d(ii+1) = d(ii)-dd;                   %updated position with updated gravity
    
    %Velocity with static gravity
    dvdt2 = 9.81 - cd/m*v2(ii)^2;           %skydivers current acceleration with static gravity
    v2(ii+1) = v2(ii) + dvdt2*delt;         %updated velocity with static gravity
end

%Graphing
figure
hold on
plot(t,term_vel*ones(size(t)),'r--','linewidth',2,'DisplayName','Terminal Velocity')
plot(t,v,'b.-','markersize',20,'linewidth',2,'DisplayName','Simulated Velocity with Current Gravity ')
plot(t,v2,'m.-','markersize',20,'linewidth',2,'DisplayName','Simulated Velocity with Static Gravity')
xlabel('t (seconds)')
ylabel('v (m/s)')
legend('show','Location','southeast')