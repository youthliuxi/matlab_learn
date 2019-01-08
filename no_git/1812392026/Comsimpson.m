%Comsimpson.m
function s=Comsimpson(fun,a,b,n)
syms x;
h=(b-a)/n;
xvalue=zeros(1:n+1);
xvalue(1)=a;
for k1=1:n;
    xvalue(k1+1)=xvalue(k1)+h;
end
yvalue=zeros(1:n+1);
for k2=1:(n+1);
    yvalue(k2)=double(subs(fun,x,xvalue(k2)));
end
s=h/3*(yvalue(1)-yvalue(n+1));
for k3=1:(n/2);
    s=h/3*(2*yvalue(2*k3+1)+4*yvalue(2*k3))+s;
end
    