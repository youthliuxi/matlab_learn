% 上机题3，牛顿迭代法
clc
clear all
eps= 1e-5;
N=50;
x0= 0;%改变初值，分别取0和1.5，并比较迭代次数
phi= @ (x)(x- (x^3-x-1)/(3*x^2-1));
Hfun= @ Newton;
[k,x]= feval(Hfun,phi,x0,eps,N)