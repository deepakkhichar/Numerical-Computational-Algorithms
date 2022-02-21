
f = @(x) x^4 - 16*x^3 + 89*x^2 - 194*x +120;

x0=1.5;
iteration = 0;
while abs(f(x0))>10^(-10)
    
    iteration = iteration+1;
    d_x0 = (f(x0+f(x0)) - f(x0))/f(x0);
    x1 = x0-(f(x0))/d_x0;
 
    if iteration >2
        enplus = abs(x1-x0);
        m = (log(enplus/en))/(log(en/enminus));
        A=zeros(1,2);
        A(1,1)=iteration;
        A(1,2)=m;
        fprintf("during iteration %d, order of convergence is %f \n",A)
        enminus = en;
        en = enplus;
        
    else
        if iteration == 1
            enminus= abs(x1-x0);
        else
            en = abs(x1-x0);
        end
    end
    x0=x1;
end
fprintf("A root of f(x) is %f \n",x0);





