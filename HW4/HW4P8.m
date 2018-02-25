function x = HW4P8(A,b) %input A and b matrices, A being a square matrix and b a vector with equivalent rows to A. Output is the solution set
Ab = [A,b]; %create matrix from A and b
[row, col] = size(Ab);  %find row and column sizes of Ab matrix, NOTE: they're equal, used for clarity sake
%Forward elimination
%Reduce to an upper triangular system
for jj = 1:row-1    %Search each column
    %Pivoting
    %Move the highest value in a column to the top of the matrix, along
    %with the rest of its row, and switch positions with the row currently
    %at the top
    [~,save] = max(abs(Ab(jj:row,jj)));    %Find the row with the highest value in th current column and saves it
    save = save + jj - 1; %Check if the max is already at the top row...
    if save ~= jj %... if so, do not switch rows
        Ab([jj,save],:) = Ab([save,jj],:);    %Otherwise, switch rows
    end
    for ii = jj+1:row %Search each row
        delt = Ab(ii,jj)/Ab(jj,jj); %Reducing rule
        Ab(ii,jj:col) = Ab(ii,jj:col)-delt*Ab(jj,jj:col);   %Replace the current ii row with 
    end
end
%Backward substitution
%Solve each equation created from forward elimination, starting from the
%bottom row, all the way to the top row
x = zeros(row,1);   %Create emppty vector, this is where the found x-values will go
x(row) = Ab(row,col)/Ab(row,row);   %The x-value found after utilizing the reducing rule
for kk = row-1:-1:1 %Perform the action at each row/equation
    x(kk)=( Ab(kk,col)-Ab(kk,kk+1:row)*x(kk+1:row) )/Ab(kk,kk); %Back substitution equation
end
end