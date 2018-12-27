clear
clc
syms x u;
a=1;b=3;h=0.01;u0=2;
format long
fun=u+exp(x)+x*u;
Hfun=@ ImprovedEuler;
Ivalue=feval(Hfun,fun,a,b,h,u0)