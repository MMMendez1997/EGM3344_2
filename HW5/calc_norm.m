function [norm] = calc_norm(A,n)    % Input matrix A and desired norm, output norm value
[row,col] = size(A);    % Find number of rows and columns in matrix A
y = 0;  % Placeholder

% Norm cases:
% For Frobenius norm, set n = 'f'
% For 1-norm, set n = 1
% For inf-norm, set n = inf

switch n    %Determines which desired norm case to use
    % Frobenius norm
    case 'f'
        for ii = 1:row  % Search each row value
            for jj = 1:col  % Search each column value
                x = (A(ii,jj))^2;   % Find the value at each index and square it
                y = y + x;  % Add each index to a total index, summing the squared index values of the matrix
            end
        end
        norm = sqrt(y); % Norm for Frobenius norms is the square root of the sum of the squared index values
    
    % 1-norm
    case 1
        for jj = 1:col  % Search each col value
            for ii = 1:row  % Search each row value
                x(ii) = abs(A(ii,jj));  % Cycles through row values at current column and inputs them into a vector
                if ii == row    % Stop once at the end of the rows
                    y(jj) = sum(x); % Sum the row values at current column and input them into a vector
                end
            end
        end
        norm = max(y);  % Norm for 1-norm is the largest summation of row values for a column
   
    % Inf-norm
    case inf
        for ii = 1:row  % Search each row value
            for jj = 1:col  % Search each col value
                x(jj) = abs(A(ii,jj));  % Cycles through column values at current row and inputs them into a vector
                if jj == col    % Stop once at the end of the columns
                    y(ii) = sum(x); % Sum the column values at current row and input them into a vector
                end
            end
        end
        norm = max(y);  % Norm for inf-norm is the largest summation of column values for a row
end