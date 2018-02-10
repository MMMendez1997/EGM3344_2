function [sum, error] = arctan(x, error)
sum=0;
n = 0;
while error < abs((sum - atan(x))/atan(x))*100
    n = n + 1;
    term = ((-1)^(n-1))*(x^(2*n-1))/(2*n-1);
    sum = sum + term;
end
[sum, error]
end