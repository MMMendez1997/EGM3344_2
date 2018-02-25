function [L,U,P] = HW4P9(A) %input A matrix, output lower triangular, upper triangular, and permutation matrices 
n = length(A);  %assuming a square matrix, n is the amount of rows and columns of matrix A
U = A;  %create new matrix identical to matrix A
L = zeros(n);	%create new empty matrix the same size as matrix A
PV = (0:n-1).'; %transposed vector of length 1 less than A
for ii = 1:1:n %from 1 to length of matrix
    %Pivoting
    %Move the highest value in a column to the top of the matrix, along
    %with the rest of its row, and switch positions with the row currently
    %at the top. Similar to how it's done for problem 8, but adapted for
    %multiple matrices.
    [~,save] = max(abs(U(ii:n,ii)));
    save = save + (ii-1);
    t = PV(ii);
    PV(ii) = PV(save);
    PV(save) = t;
    t = L(ii,1:ii-1);
    L(ii,1:ii-1) = L(save,1:ii-1);
    L(save,1:ii-1) = t;
    t = U(ii,ii:end);
    U(ii,ii:end) = U(save,ii:end);
    U(save,ii:end) = t;
    
    %LU Factorization
    L(ii,ii) = 1;
    for kk = (1+ii):size(U,1)
       c = U(kk,ii)/U(ii,ii);   %new value
       U(kk,ii:n) = U(kk,ii:n) - U(ii,ii:n)*c;  %replace all values in the row
       L(kk,ii) = c;    %replace value at (kk,ii)
    end
end
P = zeros(n);   %create new empty matrix the same size as matrix A
P(PV(:)*n+(1:n)') = 1;
end