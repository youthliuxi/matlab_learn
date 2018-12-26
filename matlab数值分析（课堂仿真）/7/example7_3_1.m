% Example7_3_1.m
eps=1e-8;
N=100;
x0=-0.7;
f=@ (x)(x^3+x-1);
Df=@ (x)(3*x^2+1);
Hfun=@ EquaNewton;
[k,x,f_value]=feval(Hfun,f,Df,x0,eps,N)