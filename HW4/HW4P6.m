function [trans_matrix] = HW4P6(matrix) %input matrix, ouput that matrix transposed
[row,col] = size(matrix);   %find the number of rows and columns
trans_matrix = zeros(col,row);  %create a transposed matrix of the original with zero values
for ii = 1:row %for all row values
    for jj = 1:col %for all column values
        trans_matrix(jj,ii) = matrix(ii,jj);    %puts the (row,column) value of the original matrix in the (column,row) of the transposed matrix
    end
end
end