% 上机题2_(1) 不动点迭代
clc
clear all
eps= 1e-5;
N=100;
x0=0.5;
phi= @(x) ((1/3*exp(x))^0.5);
Hfun= @Budongdian;
[k,x]= feval(Hfun,phi,x0,eps,N)