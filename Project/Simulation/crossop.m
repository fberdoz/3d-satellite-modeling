function [X_cross] = crossop(X)
%CROSSOP takes the column vector X and return the 3x3 matrix X^x
X_cross=[0,-X(3),X(2);
         X(3), 0, -X(1);
         -X(2), X(1), 0];
end

