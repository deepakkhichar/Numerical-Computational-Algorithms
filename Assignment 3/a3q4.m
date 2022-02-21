%Solving question4 part (i)
fprintf("Question 4 part (i)  :\n");

x1_prev = 1/2;
x2_prev = 1/2;

condition = true;

while(condition)
    x1_new = (11 - x2_prev )/10;
    x2_new = (11 - x1_new)/10;
    
    %Compairing with tolerance = 10^(-4) in the l∞ norm
    if max(abs(x1_new-x1_prev),abs(x2_new-x2_prev))<10^(-4)
        condition = false;
    end
    
    x1_prev = x1_new;
    x2_prev = x2_new;
    
end

oo = zeros(1,2);
oo(1,1) = x1_new;
oo(1,2) = x2_new;
fprintf(" Using Gauss-Seidel method, obtained value of (x1, x2, x3) is (%f, %f) \n\n",oo);



%Solving question4 part (ii)
fprintf("Question 4 part (ii)  :\n");

tol = 10^(-10);

%taking initial guess
x1_prev = 0;
x2_prev = 0;
x3_prev = 0;

condition = true;

while(condition)
    x1_new = (3 - x2_prev + x3_prev)/4;
    x2_new = (19 - 2*x1_prev - x3_prev)/7;
    x3_new = (31 - x1_prev + 3*x2_prev)/12;
    
    if abs(x1_new-x1_prev)<tol
        if  abs(x2_new-x2_prev)<tol 
            if abs(x3_new-x3_prev)<tol 
                condition = false;
            end
        end
    end
    
    x1_prev = x1_new;
    x2_prev = x2_new;
    x3_prev = x3_new;
    
end
ee = zeros(1,3);
ee(1,1) = x1_new;
ee(1,2) = x2_new;
ee(1,3) = x3_new;

fprintf(" Using Gauss Jacobi method, obtained value of (x1, x2, x3) is (%f, %f, %f) \n",ee);

