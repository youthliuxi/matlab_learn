% �ϻ���3��ţ�ٵ�����
clc
clear all
eps= 1e-5;
N=50;
x0= 0;%�ı��ֵ���ֱ�ȡ0��1.5�����Ƚϵ�������
phi= @ (x)(x- (x^3-x-1)/(3*x^2-1));
Hfun= @ Newton;
[k,x]= feval(Hfun,phi,x0,eps,N)