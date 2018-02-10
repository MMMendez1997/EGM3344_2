clc;clear

%Variables
m = 95;	%mass
t = 9;	%time
v = 46;	%velocity
g = 9.81;	%gravity
xl = .2;	%lower limit
xu = .5;	%upper limit
xm = (xl + xu)/2;	%approximated root
cd = xl:.01:xu;		%vector of drag coefficient along upper and lower limits
f = sqrt((g*m)./cd).*tanh(sqrt((g.*cd)/m).*t)-v;	%function 

%Root finding
iter = 0;	%iteration counter
error = 1;	%initial error
while error > 10^-8	%stopping criterion
    if (sqrt((g*m)./xl).*tanh(sqrt((g.*xl)/m).*t)-v)*(sqrt((g*m)./xm).*tanh(sqrt((g.*xm)/m).*t)-v) < 0	%using bisection method to determine which half of the interval to discard
        xu = xm;	%upper half discarded
    else
        xl = xm;	%lower half discarded
    end
    xm_prev = xm;	%previous root updated for next iteration
    xm = (xl + xu)/2;	%update law
    error = abs((xm-xm_prev)/xm);   %error calculation
    iter = iter + 1;    %update iteration
end