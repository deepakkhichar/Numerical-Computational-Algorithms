uk = zeros(1,11);
vk = zeros(1,11);
wk = zeros(1,11);

f = @(x) x^3-x^2+32;

uk(1,1) = rand(1,1);
if f(uk(1,1))>0
    vk(1,1)= -3;
else
    vk(1,1)=1
end

wk(1,1)= (uk(1,1)*f(vk(1,1))-vk(1,1)*f(uk(1,1)))/(f(vk(1,1))-f(uk(1,1)));

for i=2:1:11
  
    if f(wk(1,i-1))*f(uk(1,i-1))>0
        uk(1,i) = wk(1,i-1);
        vk(1,i) = vk(1,i-1);
    else
        uk(1,i) = uk(1,i-1);
        vk(1,i) = wk(1,i-1);
    end
    
    wk(1,i)= (uk(1,i)*f(vk(1,i))-vk(1,i)*f(uk(1,i)))/(f(vk(1,i))-f(uk(1,i)));
    
end
    
e = zeros(1,22);
e(1,1:11)=uk;
e(1,12:22)=vk;
fprintf("Let F(x)= x^3 - x^2 + 32 \n Sequence uk is :\n     (u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10) = (%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f) \n Sequence vk is :\n     (v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10) = (%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f)\n",e);

