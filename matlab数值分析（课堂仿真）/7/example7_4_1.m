% Example7_4_1.m
eps=1e-8;
N=300;
x0=-0.7;
x1=2;
f=@ (x)(x^3+x-1);
Hfun=@ Secant;
[k,x,f_value]=feval(Hfun,f,x0,x1,eps,N)