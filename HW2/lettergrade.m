function grade = lettergrade(score)
if score > 100      %Check if value is between 0 and 100
    error('Please enter a value between 0 and 100.')
elseif score >= 90  %A score
    grade = 'A';
elseif score >= 80  %B score
    grade = 'B';
elseif score >= 70  %C score
    grade = 'C';
elseif score >= 60  %D score
    grade = 'D';
else                %F score
    grade = 'F';
end
end