clc;
clear;
format long;
syms x u;
fun=x^(-2)*(x*u-u^(2));
a=1;b=3;h=0.01;
u0=2;n=(b-a)/h+1;x1=a:h:b;
uzhunque=zeros(1,n);% �洢׼ȷ��
uzhunque(1)=u0;
E=zeros(1,n);% �洢���
Hfun=@ FourRungeKutta;
Ivalue=feval(Hfun,fun,a,b,h,u0);
for nn=1:n% ѭ������
    uzhunque(nn)=double(1/(0.5+log(x1(nn)))*x1(nn))% ׼ȷ��
    E(nn)=abs(Ivalue(nn)-uzhunque(nn));% ���
end