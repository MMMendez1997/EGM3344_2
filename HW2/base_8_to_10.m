function [base10] = base_8_to_10(base8)

% Variables
base8 = num2str(base8);     %Convert base8 number to string
base10 = 0;
counter_l = 0;
counter_r = 0;

% Finding number of digits to the left of decimal point
for ii = 1:length(base8)
    if isstrprop(base8(ii),'digit')
        counter_l = counter_l + 1;
    else
        break
    end
end

% Finding number of digits to the right of decimal point
for jj = length(base8):-1:1
    if isstrprop(base8(jj),'digit')
        counter_r = counter_r + 1;
    else
        break
    end
end

% Converting digits to the left of decimal point to base 10 notation
for kk = 1:counter_l
    base10 = base10 + str2num(base8(kk))*(8^(counter_l-kk));
end

% Converting digits to the right of decimal point to base 10 notation
if counter_r > 0 && counter_r ~= length(base8)  %Check if any decimal point present
    for ll = 1:counter_r
        base10 = base10 + str2num(base8(counter_l+1+ll))*(8^(-ll));
    end
end
end