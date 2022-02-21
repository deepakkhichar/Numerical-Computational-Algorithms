%{  
 We are required to approximate x = 1/a for any given a!=0 without using
 division.

 Solution:
 
 Inorder to solve the problem, first we will form a function f(x) such that root
 of f(x) is 1/a. Now, we will find the root (= 1/a) of f(x) using Newton
 raphson method.

 


%}



%generating random number a such that a!=0   
n = rand(1,1);    
m = rand(1,1);
sign = randi([-3,3],1,1);

if sign>0
    a = n/m;
else
    a = -n/m;
end

%approximatin x = 1/a without using division
f =@(x)  a*x - 1;
x0 = a+1;
error = 10^(-10);
while abs(f(x0)) >error
    
    x1 = x0 - f(x0)/a;     %f'(x) = a  for all x
    x0=x1;
end
A=zeros(1,2);
A(1,1)=a;
A(1,2)=x0;
fprintf(" for given a = %f , approximate value of x such that x=1/a is %f \n",A);




