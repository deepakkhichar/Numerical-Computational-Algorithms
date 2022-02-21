%{ 
given:
dy/dx = f(x,y) where f(x,y) = y/x - (y/x)^2
x ∈ [1,2]

y(1)=1
%}

h=0.01;

X=zeros(1,101);
X(1,1)=1;
for i=2:1:101
    X(1,i) = X(1,i-1)+h;
end
Y=zeros(1,101);

Y(1,1)=1;

for i=2:1:101
    k1 = Y(1,i-1)/X(1,i-1) - (Y(1,i-1)/X(1,i-1))^2;
    k2 = (Y(1,i-1)+h*k1/2)/(X(1,i-1)+h/2) - ((Y(1,i-1)+h*k1/2)/(X(1,i-1)+h/2))^2;
    k3 = (Y(1,i-1)+h*k2/2)/(X(1,i-1)+h/2) - ((Y(1,i-1)+h*k2/2)/(X(1,i-1)+h/2))^2;
    k4 = (Y(1,i-1)+h*k3)/(X(1,i-1)+h) - ((Y(1,i-1)+h*k3)/(X(1,i-1)+h))^2;
    Y(1,i) = Y(1,i-1) + h*(k1 + 2*k2 + 2*k3 + k4)/6;
end

fprintf("An approximation upto y(2) using the Runge-Kutta method of order 4 is %f \n",Y(1,101));
plot(X,Y)