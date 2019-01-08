% 上机题1，误差对比
clear
clc
syms x u;
a=0;
b=1;
h=0.1;
u0=1;
format long
fun=-u^2;
Efun= @Euler;
ImEfun= @ImprovedEuler;
Uvalue= 0.5;
Ivalue1= feval(Efun,fun,a,b,h,u0);
Ivalue2= feval(ImEfun,fun,a,b,h,u0);
Erro1= abs(Ivalue1-Uvalue);
Erro2= abs(Ivalue2-Uvalue);
compare= Erro1-Erro2