
n = 5;

fprintf(" If we take n=%d, ai's, bi's, ci's and di's as:  \n", n);

ai = [0 2 4 5 1]
bi = [4 9 1 4 5]
ci = [3 9 2 3 0]
di = [2 5 4 1 6]

% checking if we can solve the given system of equations?
check = zeros(n,n);
check(1,1)=bi(1,1);
check(1,2) = ci(1,1);
check(n,n-1)=ai(1,n);
check(n,n)=bi(1,n);
for i=2:1:n-1
    for j=i-1:1:i+1
        check(i,i-1) = ai(1,i);
        check(i,i) = bi(1,i);
        check(i,i+1) = ci(1,i);
    end
end

if det(check)==0
    error("Please choose some different values of ai's, bi's or ci's.")
end


% Using special case of Gaussian elimination method to solve the system
        
ci_new = zeros(1,n);
ci_new(1,1) = ci(1,1)/bi(1,1);

di_new = zeros(1,n);
di_new(1,1) = di(1,1)/bi(1,1);

for i = 2:1:n-1
    ci_new(1,i) = ci(1,i)/(bi(1,i)-ai(1,i)*ci_new(1,i-1));
    di_new(1,i) = (di(1,i) -ai(1,i)*di_new(1,i-1))/(bi(1,i)-ai(1,i)*ci_new(1,i-1));
end
di_new(1,n) = (di(1,n) -ai(1,n)*di_new(1,n-1))/(bi(1,n)-ai(1,n)*ci_new(1,n-1));
xi = zeros(1,n);

xi(1,n) = di_new(1,n);

for i=n-1:-1:1
        xi(1,i) = di_new(1,i)-ci_new(1,i)*xi(1,i+1);
end

fprintf("Then, xi's obtained on solving the given system by the special case of Gaussian Elimination method are:  \n");

xi

t=zeros(n,1);
for i=1:1:n
    t(i,1)=xi(1,i);
end

check*t
di
    

