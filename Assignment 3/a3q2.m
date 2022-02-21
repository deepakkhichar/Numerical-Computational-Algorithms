% Differential Equation : u"-xu'+2u-(x+2)=0
% Solution : u(x) = x^2+x
% p(x)=x
% q(x)=-2
% f(x)=-(x+2)
% g0=0;
% g1=2;


g0=0;
g1=2;


a=0;
b=1;
h=0.001;
n=(b-a)/h+1;

x=zeros([1,n]);
A=zeros([n,1]);
B=zeros([n,1]);
C=zeros([n,1]);
D=zeros([n,1]);

h_temp=a;
for i=1:n
    x(i)=x(i)+h_temp;
    h_temp=h_temp+h;
end


p=a;
for i=1:n
    if i==1
        p=p+h;
        continue;
    end
    A(i,1)=1-h*(-p)/2;
    p=p+h;
end



q=a;
for i=1:n
    B(i,1)=-2+(h^2)*2;
    q=q+h;
end



p=a;
for i=1:n
    if i==n
        continue;
    end
    C(i,1)=1+h*(-p)/2;
    p=p+h;
end


r=a;
for i=1:n
    if i==1
        D(i,1)=D(i,1)-g0*(1+h*(-x(1)/2));
        continue;
    end
    if i==n
        D(n,1)=D(n,1)-g1*(1+h*(-x(n)/2));
        continue;
    end
    D(i,1)=(h^2)*(r+2);
    r=r+h;
end


% A, B, C, D are generated, now use Tria-Diagonal system solution and
% evaluate u(x)

% Using special case of Gaussian elimination method to solve the system
        
A=transpose(A);
B=transpose(B);
C=transpose(C);
D=transpose(D);

ci_new = zeros(1,n);
ci_new(1,1) = C(1,1)/B(1,1);

di_new = zeros(1,n);
di_new(1,1) = D(1,1)/B(1,1);

for i = 2:1:n-1
    ci_new(1,i) = C(1,i)/(B(1,i)-A(1,i)*ci_new(1,i-1));
    di_new(1,i) = (D(1,i) -A(1,i)*di_new(1,i-1))/(B(1,i)-A(1,i)*ci_new(1,i-1));
end
di_new(1,n) = (D(1,n) -A(1,n)*di_new(1,n-1))/(B(1,n)-A(1,n)*ci_new(1,n-1));
u = zeros(1,n);

u(1,n) = di_new(1,n);

for i=n-1:-1:1
        u(1,i) = di_new(1,i)-ci_new(1,i)*u(1,i+1);
end



disp('Equation  : u"'+"-xu'+2u-(2+x)=0");
disp("Solution u(x) = x + x^2");
disp("Step size "+h);
disp("Output u(x) -");
    for i=1:n
        disp("(x,u) = ("+x(i)+","+u(i)+")");
    end