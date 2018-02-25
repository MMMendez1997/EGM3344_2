E = 1;  %machine epsilon initial value
while E+1 > 1   %while machine epsilon is a non zero value
    E = E/2;    %update
end
E = E*2;    %machine epsilon is double the first value to end while loop