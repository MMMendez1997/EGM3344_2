function [sum, error] = taylor_sine(x, n)
sum(1)=0;
for ii = 1:n
    term = ((-1)^(ii-1))*(x^(2*ii-1))/factorial(2*ii-1);
    sum(ii+1) = sum(ii) + term;
    error = abs((sum(ii+1)-sum(ii))/sum(ii))*100;
end
end