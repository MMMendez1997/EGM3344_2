%HW1Q4
%% Initialize Variables and Parameters
delt1 = 2;      %step size (s)
delt2 = 1;      %step size (s)
delt3 = .5;     %step size (s)
[t1, v1] = HW1Q3(delt1);
[t2, v2] = HW1Q3(delt2);
[t3, v3] = HW1Q3(delt3);
term_vel = sqrt(g*m/cd);    %terminal velocity (m/s)
hold on     %don't overwrite plot
plot(t,term_vel*ones(size(t)),'r--','linewidth',2,'DisplayName','Terminal Velocity')   %plot terminal velocity
plot(t1,v1,'b.-','markersize',20,'linewidth',2,'DisplayName','Simulated Velocity 1 (step = 2s)')   %plot results
plot(t2,v2,'g.-','markersize',20,'linewidth',2,'DisplayName','Simulated Velocity 2 (step = 1s)')   %plot results
plot(t3,v3,'m.-','markersize',20,'linewidth',2,'DisplayName','Simulated Velocity 3 (step = 0.5s)')   %plot results
xlabel('t (seconds)')   %add x-label
ylabel('v (m/s)')   %add y-label
legend('show','Location','southeast')    %add legend