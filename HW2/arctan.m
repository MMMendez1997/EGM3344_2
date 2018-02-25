function [sum, error] = arctan(x, error)    %input value and maximum error, output answer (sum) and error
sum=0;  %initial answer
n = 0;  %term
while error < abs((sum - atan(x))/atan(x))*100  %error aproximation, stopping criterion
    n = n + 1;  %term counter
    term = ((-1)^(n-1))*(x^(2*n-1))/(2*n-1);    %approximation for this term
    sum = sum + term;   %add approximation for this term to sum
end
[sum, error]    %tabulate outputs
end