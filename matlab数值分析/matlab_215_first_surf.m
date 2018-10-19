%第一型曲面积分
%第一题
syms x y z
z=1-x-y;
ds=sqrt(1+diff(z,x)^2+diff(z,y)^2);
%密度函数
f=x*y*z
int1=int(f*ds,y,0,1-x);
int_1=int(int1,x,0,1)

%第二题
clear
syms rou theta;
%向量函数
x=rou*cos(theta);
y=rou*sin(theta);
z=rou;
%分别计算出E,G,F
E=diff(x,rou)^2+diff(y,rou)^2+diff(z,rou)^2;
F=diff(x,rou)*diff(y,theta)+diff(y,rou)*diff(y,theta)+diff(z,rou)*diff(z,theta);
G=diff(x,theta)^2+diff(y,theta)^2+diff(z,theta)^2;
%分别把E，F，G化简
E=simplify(E);
F=simplify(F);
G=simplify(G);
%面积微元
ds=simplify(sqrt(E*G-F*F));
%被积函数
f=x*y+y*z+z*x;
int1=int(f*ds,rou,0,sin(theta));
int_2=int(int1,theta,0,pi);
%作出圆锥面函数图像
syms x y
z=sqrt(x^2+y^2);
ezsurf(z,'circ')