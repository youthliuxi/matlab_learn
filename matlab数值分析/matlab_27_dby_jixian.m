syms x y;
%第一题
y1=(x^2+y^2)/(sqrt(1+x*x+y*y)-1);
%运用累次极限求重极限
lim_y1=limit(limit(y1,x,0),y,0)
subplot(2,2,1),ezsurf(y1)
%第二题
y2=(x+y)*sin(1/(x*x+y*y));
lim_y2=limit(limit(y2,x,0),y,0)
subplot(2,2,2),ezsurf(y2)
%第三题
y3=(x*x+y*y)/(x^4+y^4);
lim_y3=limit(limit(y3,x,inf),y,inf)
subplot(2,2,3),ezsurf(y3)
%第四题
y4=(1+1/x/y)^(x*sin(y));
lim_y4=limit(limit(y4,x,inf),y,inf)
subplot(2,2,4),ezsurf(y4)