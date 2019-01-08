% …œª˙Ã‚2_(1) Aitkin
clc
clear all
eps= 1e-5;
N=50;
x0=0.6;
phi= @ (x)((1/3*exp(x))^0.5);
Hfun= @ Aitkin;
[k,x]= feval(Hfun,phi,x0,eps,N)