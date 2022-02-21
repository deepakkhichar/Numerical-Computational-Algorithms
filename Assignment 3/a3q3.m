
a=-4;
b=4;
f = @(x) 1/(1+x^2);






%Solving question3 part a

fprintf("Question 3 part a  :\n\n");

% Using Trapezoidal rule
I_trapezoidal = ((b-a)/2)*(f(a)+f(b));

fprintf(" Using Trapezoidal rule, the value of integral I is %f \n\n\n",I_trapezoidal);









%Solving question3 part b

fprintf("Question 3 part b  :\n\n");

%Using Simpson's rule
c = (a+b)/2;
h = (b-a)/2;

I_simpson = (h/3)*(f(a)+4*f(c)+f(b));

fprintf(" Using Simpson's rule, the value of integral I is %f \n\n\n",I_simpson);










%Solving question3 part c

fprintf("Question 3 part c  :\n\n");

n=10;


%composite trapezoidal
h = (b-a)/n;
x0=a;
xn=b;
I_composite_trapezoidal = h*(f(x0)+f(xn))/2;
for i = 1:1:n-1
    xi=a+i*h;
    I_composite_trapezoidal = I_composite_trapezoidal + h*f(xi);
end

fprintf(" Using Composite Trapezoidal rule, the value of integral I is %f \n",I_composite_trapezoidal);


%composite Simpson's rule
h = (b-a)/n;
x0=a;
xn=b;
I_composite_simpson = h*(f(x0)+f(xn))/3;
for i = 1:1:n-1
    xi=a+i*h;
    if mod(i,2)==1
        I_composite_simpson = I_composite_simpson + (h/3)*4*f(xi);
    else
        I_composite_simpson = I_composite_simpson + (h/3)*2*f(xi);
    end
end

fprintf(" Using Composite Simpson's rule, the value of integral I is %f \n\n\n",I_composite_simpson);






%Solving question3 part d

fprintf("Question 3 part d  :\n\n");


% Changing integral over [a,b] into an integral over [-1,1]
f_new = @(x) ((b-a)/2)*(1/(1+((b-a)*x/2 + (a+b)/2)^2));

% Applying two point Gauss-Legendre quadrature
I_gaussian_quadrature = f_new(-1/(3^(1/2))) + f_new(1/(3^(1/2)));

fprintf(" Using two point Gauss-Legendre quadrature, the value of integral I is %f \n\n",I_gaussian_quadrature);


% Compairing with results obtained in a
fprintf("Compairing with results obtained in part a :\n");

diff_a = I_gaussian_quadrature - I_trapezoidal ;
 
if diff_a==0;
    fprintf(" The value of integral I obtained by using Trapezoidal rule is same as that obtained by using two point Gauss-Legendre quadrature\n\n");
elseif diff_a>0
    fprintf(" The value of integral I obtained by using Trapezoidal rule is less that obtained by using two point Gauss-Legendre quadrature. The difference in value of Integral I, i.e., I(using two point Gauss-Legendre quadrature) - I(using Trapezoidal rule) is %f \n\n", diff_a);
else
    
    fprintf(" The value of integral I obtained by using Trapezoidal rule is greater that obtained by using two point Gauss-Legendre quadrature. The difference in value of Integral I, i.e., I(using two point Gauss-Legendre quadrature) - I(using Trapezoidal rule) is %f \n\n", diff_a);
end

% Compairing with results obtained in b
fprintf("Compairing with results obtained in part b :\n");

diff_b = I_gaussian_quadrature - I_simpson ;
 
if diff_b==0;
    fprintf(" The value of integral I obtained by using Simpson's rule is same as that obtained by using two point Gauss-Legendre quadrature\n\n");
elseif diff_b>0
    fprintf(" The value of integral I obtained by using Simpson's rule is less that obtained by using two point Gauss-Legendre quadrature. The difference in value of Integral I, i.e., I(using two point Gauss-Legendre quadrature) - I(using Trapezoidal rule) is %f \n\n", diff_b);
else
    
    fprintf(" The value of integral I obtained by using Simpson's rule is greater that obtained by using two point Gauss-Legendre quadrature. The difference in value of Integral I, i.e., I(using two point Gauss-Legendre quadrature) - I(using Trapezoidal rule) is %f \n\n", diff_b);
end

% Compairing with results obtained in c
fprintf("Compairing with results obtained in part c :\n");

diff_c1 = I_gaussian_quadrature - I_composite_trapezoidal ;
 
if diff_c1==0;
    fprintf(" The value of integral I obtained by using Composite Trapezoidal rule is same as that obtained by using two point Gauss-Legendre quadrature\n\n");
elseif diff_c1>0
    fprintf(" The value of integral I obtained by using Composite Trapezoidal rule is less that obtained by using two point Gauss-Legendre quadrature. The difference in value of Integral I, i.e., I(using two point Gauss-Legendre quadrature) - I(using Trapezoidal rule) is %f \n", diff_c1);
else
    
    fprintf(" The value of integral I obtained by using Composite Trapezoidal rule is greater that obtained by using two point Gauss-Legendre quadrature. The difference in value of Integral I, i.e., I(using two point Gauss-Legendre quadrature) - I(using Trapezoidal rule) is %f \n", diff_c1);
end

% Compairing with results obtained in c

diff_c2 = I_gaussian_quadrature - I_composite_simpson ;
 
if diff_c2==0;
    fprintf(" The value of integral I obtained by using Composite Simpson's rule is same as that obtained by using two point Gauss-Legendre quadrature\n\n");
elseif diff_c2>0
    fprintf(" The value of integral I obtained by using Composite Simpson's rule is less that obtained by using two point Gauss-Legendre quadrature. The difference in value of Integral I, i.e., I(using two point Gauss-Legendre quadrature) - I(using Trapezoidal rule) is %f \n\n", diff_c2);
else
    
    fprintf(" The value of integral I obtained by using Composite Simpson's rule is greater that obtained by using two point Gauss-Legendre quadrature. The difference in value of Integral I, i.e., I(using two point Gauss-Legendre quadrature) - I(using Trapezoidal rule) is %f \n\n", diff_c2);
end






