

% 1(a)



fprintf("Question 1 part a  \n");


n = 5;
A = [2 3 5 1 4; 7 2 -1 0 7; -1 2 -7 -2 9; 3 7 -6 1 3; 1 4 7 3 2];
%A = [4 3 0 0 0; 2 9 9 0 0; 0 4 1 2 0; 0 0 5 4 3; 0 0 0 1 5]

if det(A)==0
    error(" Since determinant of given matrix A is 0, therefore, it is a singular matrix. Hence it is not a valid matrix A for this question. Please choose another matrix A.");
end

U=A;

L = zeros(n,n);

for i = 1:1:n
    L(i,i) =1;
end



for k = 1:1:n-1
    for i = k+1:1:n
        if U(k,k)==0
            error("Although matrix A is a non-singular matrix, but in order to slolve for this matrix A, pivoting is required. Since Biswarup sir clarified that pivoting is not necessary for Q1, therefore matrix A is not a valid matrix for this question. Please choose another matrix A.");
        end
        L(i,k) = U(i,k)/U(k,k);
        for j = k:1:n
            U(i,j) = U(i,j) - L(i,k)*U(k,j);
        end
    end
end

fprintf("\nfor the matrix A,\n ");
A
fprintf(" Two matrices L, U such that A = LU where L is lower triangular and U is upper triangular are: \n");
L
U

if A==L*U
   
    disp("dsd")
else
    disp(":(")
end




% 1(b)




fprintf("\nQuestion 1 part b  \n");


fprintf("\nFor column vector b, \n");

b = [ 3; 7; 5; 1; 9]
%b = [2; 5; 4; 1; 6]

Z = zeros(n,1);
x = zeros(n,1);

% solving Lz=b

Z(1,1) = b(1,1)/L(1,1);

for i=2:1:n
    f=0;
    for j = 1:1:i-1
        f = f + L(i,j)*Z(j,1);
    end
    Z(i,1) = (b(i,1)-f)/L(i,i);
end

% solving Ux=z

x(n,1) = Z(n,1)/U(n,n);

for i=n-1:-1:1
    f=0;
    for j = i+1:1:n
        f = f + U(i,j)*x(j,1);
    end
    x(i,1) = (Z(i,1)-f)/U(i,i);
end


fprintf("\n Column Vector x such that Ax=b is: \n");

x

A*x
b
if A*x==b
   
    disp("woieeee")
else
    disp(":(")
end




