%多元函数的偏导数运算
syms x y;
%第一题
z=exp(sin(x*y));
%关于x的偏导数
dzx=diff(z,x)
%关于y的偏导数
dzy=diff(z,y)
%先对x求偏导数，后对y求偏导数
dzxy=diff(dzx,y)
%画图
subplot(2,2,1),ezsurf(z)
subplot(2,2,2),ezsurf(dzx)
subplot(2,2,3),ezsurf(dzy)
subplot(2,2,4),ezsurf(dzxy)