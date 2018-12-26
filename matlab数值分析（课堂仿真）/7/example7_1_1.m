% Example7_1_1.m
a=0;b=1;
eps1=1e-4;eps2=1e-4;
N=300;
f=@ (x)(x^3-3*x^2+6*x-1)
Hfun=@ Bisection;
[k,x,f_value]=feval(Hfun,f,a,b,eps1,eps2,N)