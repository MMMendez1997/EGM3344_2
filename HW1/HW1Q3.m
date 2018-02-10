function [t, v] = HW1Q3(delt)
%HW1Q3
%% Initialize Variables and Parameters
g = 9.81;   %gravity (m/s^2)
cd = 0.25;  %drag coefficient (kg/m)
m = 68.1;   %bungee-jumper mass (kg)
t = (0:delt:12)';   %time vector, 0 to 12 seconds, interval of delt
v = nan(size(t));   %initialize velocity variable as NaNs, same size as t
v(1) = 0;   %set initial velocity to 0 m/s
%% Use Euler's Method to Compute Velocity
%%Note: There is a "-1" in the for-loop below because we will calculate
%      v(ii+1) for each ii. Therefore, without the "-1", v will have an
%      extra element and be longer than t. This is a very common
%      occurrence in programming. You will use this "trick" often.
for ii=1:length(t)-1  %cycle through each element of t
    dvdt = g - cd/m*v(ii)^2;    %compute bungee jumper's current acceleration (see book for derivation)
    v(ii+1) = v(ii) + dvdt*delt;    %update law for Euler's method
end
[t v]   %show tabulated results
end