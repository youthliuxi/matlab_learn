%第二型曲线积分
%第一题
syms a t x y z
syms b positive
%曲线积分参数方程
x=a*cos(t);
y=a*sin(t);
z=b*t;
%向量场函数
F=[x*y,x-y,x^2];
ds=[diff(x),diff(y),diff(z)]';
int_curvel=int(F*ds,t,0,pi)

%第二题
syms t x y z
syms b positive
%曲线积分参数方程
x=a*cos(t);
y=a*sin(t);
z=b*t;
%向量场函数
F=[x*y,x-y,x^2];
F=[y,-x,x+y+z]
ds=[diff(x),diff(y),diff(z)]';
int_curvel=int(F*ds,t,0,pi)

%%%%%%%%%%%%%%%%%%%%%%
%百分号内部分为作图部分，画出力场的积分路线
%为了画出图形需要对a,b附数值
a=3;b=3;
x=a*cos(t);
y=a*sin(t);
z=b*t;
ezplot3(x,y,z,[0,2*pi])
%%%%%%%%%%%%%%%%%%%%%%