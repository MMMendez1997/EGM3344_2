function [base10] = base_2_to_10(base2)

% Variables
base2 = num2str(base2);     %Convert base2 number to string
base10 = 0; %placeholder
counter_l = 0;  %counter for left 
counter_r = 0;  %counter for right

% Finding number of digits to the left of decimal point
for ii = 1:length(base2)    %go over each character
    if isstrprop(base2(ii),'digit') %check for number
        counter_l = counter_l + 1;  %counting amount of numbers before hitting decimal
    else
        break
    end
end

% Finding number of digits to the right of decimal point
for jj = length(base2):-1:1 %same as previous, but going from right to left
    if isstrprop(base2(jj),'digit')
        counter_r = counter_r + 1;
    else
        break
    end
end

% Converting digits to the left of decimal point to base 10 notation
for kk = 1:counter_l
    base10 = base10 + str2num(base2(kk))*(2^(counter_l-kk));    %base10 answer if no decimal present
end

% Converting digits to the right of decimal point to base 10 notation
if counter_r > 0 && counter_r ~= length(base2)  %Check if any decimal point present
    for ll = 1:counter_r
        base10 = base10 + str2num(base2(counter_l+1+ll))*(2^(-ll)); %base10 answer
    end
end
end