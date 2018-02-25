function [sum, error] = taylor_sine(x, n)   %input value and term, output answer and error
sum(1)=0;   %vectorize answer, first value 0
for ii = 1:n %vector length equal to term
    term = ((-1)^(ii-1))*(x^(2*ii-1))/factorial(2*ii-1);    %value for this term
    sum(ii+1) = sum(ii) + term; %sum of this terms value and previous terms value is this terms answer
    error = abs((sum(ii+1)-sum(ii))/sum(ii))*100;   %error for this terms answer
end
end