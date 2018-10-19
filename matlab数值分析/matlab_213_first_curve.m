%第一型曲线积分
%第一题
syms a positive
syms t
x=a*cos(t);
y=a*sin(t);
dx=diff(x,t);
dy=diff(y,t);
%弧长微元
weiyuan=sqrt(dx^2+dy^2);
int_1=int(a^2*weiyuan,t,0,pi)

%第二题
syms a theta x y;
x=a*cos(theta)*sin(theta);
y=a*sin(theta)*sin(theta);
dx=diff(x,theta);
dy=diff(y,theta);
z=sqrt(x^2+y^2);
weiyuan=sqrt(dx^2+dy^2);
int_2=int(z*weiyuan,theta,0,pi);
int_2=simplify(int_2)
%%%%%%%%%%%%%%%%%%%%%%%
%百分号内为作图部分
a=5;
x=a*cos(theta)*sin(theta);
y=a*sin(theta)*sin(theta);
%控制坐标轴范围变量
V=[-4,4,-1,6]
ezplot(x,y,[0,pi]),axis(V),grid on
%需要对a赋值
%%%%%%%%%%%%%%%%%%%%%%%