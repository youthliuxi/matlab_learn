clc;
clear;
format long;
a=0;
b=1;
n=11;
syms x;
fun= (x)/(4+x^2);
Hfun=@ ComTixing;
Ivalue= feval(Hfun,fun,a,b,n)