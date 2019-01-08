% …œª˙Ã‚5
clear all
clc
eps= 1e-6;
N=100;
x=[2,2]';
F= @ (x)([log(x(1)^2+x(2)^2)-sin(x(1)*x(2))-log(2*pi);
    exp(x(1)-x(2))+cos(x(1)*x(2))]);
DF= @ (x)([(2*x(1))/(x(1)^2+x(2)^2)-x(2)*cos(x(1)*x(2)) (2*x(2))/(x(1)^2+x(2)^2)-x(1)*cos(x(1)*x(2));
    exp(x(1)-x(2))-x(2)*sin(x(1)*x(2)) -exp(x(1)-x(2))-x(1)*sin(x(1)*x(2))]);
Hfun= @Broyden
[k,x]= feval(Hfun,F,DF,x,eps,N)