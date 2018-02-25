clc;clear

%Variables
c01 = 10; c03 = 20; %known concentration variables
Q01 = 5; Q03 = 8; Q15 = 3; Q12 = 3; Q31 = 1; Q23 = 1; Q25 = 1; Q55 = 2; Q54 = 2; Q24 = 1; Q34 = 8; Q44 = 11;    %known flow variables
syms c1 c2 c3 c4 c5 %symbolic variables for concentrations we're looking for

%Equations for each reactor
eq1 = Q01*c01 + Q31*c3 - Q12*c1 - Q15*c1 == 0;  %reactor 1
eq2 = Q12*c1 - Q25*c2 - Q24*c2 - Q23*c2 == 0;   %reactor 2
eq3 = Q03*c03 + Q23*c2 - Q31*c3 - Q34*c3 == 0;  %reactor 3
eq4 = Q24*c2 + Q54*c5 + Q34*c3 - Q44*c4 == 0;   %reactor 4
eq5 = Q15*c1 + Q25*c2 - Q55*c5 - Q54*c5 == 0;    %reactor 5

[A,b] = equationsToMatrix([eq1, eq2, eq3, eq4, eq5],[c1, c2, c3, c4, c5]); %creates two matrices: one with the reactor equations, the other with the concentratins we're looking for
conc = A\b; %solves the LU factorization problem from the matrices previously created, giving the unknown concentration values
disp(conc)