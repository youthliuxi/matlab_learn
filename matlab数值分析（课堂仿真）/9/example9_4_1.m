% Example9_4_1.m
clc;
clear;
format long;
syms x u;
fun=-2*x*u^(2);
h=0.05;% ����
a=0;b=2;u0=1;n=(b-a)/h+1;
x1=a:h:b;
uzhunque=zeros(1,n);% �洢׼ȷ��
uzhunque(1)=u0;
E=zeros(1,n);% �洢���
Hfun=@ AdamsBAM;
Ivalue=feval(Hfun,fun,a,b,h,u0)
for mm=1:n
    uzhunque(mm)=double(1/(1+x1(mm)^(2)));
    E(mm)=abs(Ivalue(mm)-uzhunque(mm));
end