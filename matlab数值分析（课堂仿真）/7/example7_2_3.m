% Example7_2_3.m
eps=1e-8;
N=300;
x0=1,5;
phi1=@ (x)(x-x^3-3*x^2+8);
phi2=@ (x)((8/x-3*x)^0.5);
phi3=@ (x)(((1/3)*(8-x^3))^0.5);
phi4=@ (x)((8/(3+x))^0.5);
phi5=@ (x)(x-x(x^3+3*x^2-8)/(3*x^2+6*x));
Hfun=@ Steffensen;
[k,x]=feval(Hfun,phi4,x0,eps,N)% 可修改此处调用其他迭代函数