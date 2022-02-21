s=0.1;
a=-10;
b=15;
k=s*(b-a);
f = @(x) tanh(x);
g = @(x) 1-(tanh(x))^2;  % g(x) is the derivative of f(x)
x0=a;
bisectionmethod = true;
while abs(f(x0))>10^(-10)
    if bisectionmethod  % Using bisection method untill the current interval in the bisection method becomes less tha s(b-a).
        x0=(a+b)/2;
        if(f(a)*f(x0)<0)
            b=x0;
        else
            a=x0;
        end
        
        if (b-a)<k
            bisectionmethod = false; %No more bisection method because length of current interval is less tha s(b-a)
            if f(a)>f(b)
                x0 = b;
            else
                x0 = a;
            end
        end
        
    else     % Using Newton's method
        
        x1 = x0 - (f(x0))/(g(x0));
        x0=x1;
    end
end

fprintf(" The root of tanh(x)=0 obtained by using combined Bisection method and Newton's method is %e \n",x0);


    