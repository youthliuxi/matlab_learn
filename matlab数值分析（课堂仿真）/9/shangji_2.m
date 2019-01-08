% …œª˙Ã‚2
clear
clc
syms x u;
a=0;
b=1;
h=0.1;
u0=1;
format long
fun=-u^2;
Hfun= @FourRungeKutta;
Ivalue= feval(Hfun,fun,a,b,h,u0)