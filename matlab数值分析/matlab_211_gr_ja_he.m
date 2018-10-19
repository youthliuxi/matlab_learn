%梯度，Jacobi矩阵和Hesse矩阵
syms x y z;
r=sqrt(x^2+y^2+z^2);
%计算梯度
grad_1=[diff(r,x),diff(r,y),diff(r,z)]
%访问Maple函数
syms x y z
disp('调用grid函数，计算得到的梯度')
grad_2=gradient(r,[x,y,z])

%jacobi矩阵
syms r fa the
x=r*sin(fa)*cos(the);
y=r*sin(fa)*sin(the);
z=r*cos(fa);
%计算jacobi矩阵
ja=jacobian([x,y,z],[r fa the])

%Hesse矩阵
syms x y
f=(x*y)*sin(x+5*y);
%分别计算各元素，对于比较大的n维变量问题
%可以设计出一个函数处理Hesse矩阵
df11=diff(diff(f,x),x);
df12=diff(diff(f,y),x);
df21=diff(diff(f,x),y);
df22=diff(diff(f,y),y);
Hesse=[df11 df12;df21 df22];
Hesse=simplify(Hesse);%simple在2014版以后便不再使用，被simplify代替
ezsurf(f)
figure(2)
subplot(2,2,1),ezsurf(df11)
subplot(2,2,2),ezsurf(df12)
subplot(2,2,3),ezsurf(df21)
subplot(2,2,4),ezsurf(df22)
%访问Maple函数计算Hesse矩阵
disp('调用hessian函数，计算得到的Hesse矩阵')
Hesse1=hessian(f,[x,y])

%三维Hesse矩阵计算
clear
syms x y z
t=(x+y)*exp(z);
hesse3D_jacobian=jacobian(jacobian(t,[x,y,z]),[x,y,z])
hesse3D=hessian(t,[x,y,z])