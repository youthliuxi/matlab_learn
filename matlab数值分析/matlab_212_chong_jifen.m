%重积分运算
%第一题 二重积分的运算
syms x y
z=exp(x^2);
%累计积分法计算重积分
int1=int(z,y,x^3,x);
int_z=int(int1,x,0,1)

%第二题 三重积分的运算
syms x y z a b c
f=x;
int1=int(f,z,0,c*(1-x/a-y/b));
int2=int(int1,y,0,b*(1-x/a));
int_f=int(int2,x,0,a)