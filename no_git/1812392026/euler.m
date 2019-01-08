%euler.m
function [x,y]=euler(f,y0,a,b,n) 
y(1)=y0;
h=(b-a)/n;
x=a:h:b;
for i=1:n
    y(i+1)=y(i)+h*feval(f,x(i),y(i));
end;