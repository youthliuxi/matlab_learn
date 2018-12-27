clc;
clear;
format long;
syms x u;
fun=x^(-2)*(x*u-u^(2));
a=1;b=3;h=0.01;
u0=2;n=(b-a)/h+1;x1=a:h:b;
uzhunque=zeros(1,n);% 存储准确解
uzhunque(1)=u0;
E=zeros(1,n);% 存储误差
Hfun=@ FourRungeKutta;
Ivalue=feval(Hfun,fun,a,b,h,u0);
for nn=1:n% 循环变量
    uzhunque(nn)=double(1/(0.5+log(x1(nn)))*x1(nn))% 准确解
    E(nn)=abs(Ivalue(nn)-uzhunque(nn));% 误差
end