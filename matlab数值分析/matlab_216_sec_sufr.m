%第二型曲面积分
%第一题
syms theta fa;
syms h a positive;
%球面的参数方程
x=a*sin(fa)*cos(theta);
y=a*sin(fa)*sin(theta);
z=a*cos(fa);
%计算C
C=diff(x,fa)*diff(y,theta)-diff(x,theta)*diff(y,fa);
C=simplify(C);
%z方向的函数
Fz=z;
int1=int(Fz*C,fa,0,pi);
int2=int(int1,theta,0,pi*2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%作出积分曲面的函数图像
a=5;
x=a*sin(fa)*cos(theta);
y=a*sin(fa)*sin(theta);
z=a*cos(fa);
ezmesh (x,y,z,[0,pi,0,2*pi])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%第二题
syms a theta z
x=a*cos(theta);
y=a*sin(theta);
%计算A,B,C
A=a*cos(theta);
B=a*sin(theta);
C=0;
%计算向量场函数
Fx=x;
Fy=y;
Fz=z;
%对三个坐标方向积分
int_x=int(int(Fx*A,theta,0,2*pi),z,-h,h);
int_y=int(int(Fy*B,theta,0,2*pi),z,-h,h);
int_z=int(int(Fz*C,theta,0,2*pi),z,-h,h);
%三者之和
int_2=int_x+int_y+int_z