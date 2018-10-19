%�ݶȣ�Jacobi�����Hesse����
syms x y z;
r=sqrt(x^2+y^2+z^2);
%�����ݶ�
grad_1=[diff(r,x),diff(r,y),diff(r,z)]
%����Maple����
syms x y z
disp('����grid����������õ����ݶ�')
grad_2=gradient(r,[x,y,z])

%jacobi����
syms r fa the
x=r*sin(fa)*cos(the);
y=r*sin(fa)*sin(the);
z=r*cos(fa);
%����jacobi����
ja=jacobian([x,y,z],[r fa the])

%Hesse����
syms x y
f=(x*y)*sin(x+5*y);
%�ֱ�����Ԫ�أ����ڱȽϴ��nά��������
%������Ƴ�һ����������Hesse����
df11=diff(diff(f,x),x);
df12=diff(diff(f,y),x);
df21=diff(diff(f,x),y);
df22=diff(diff(f,y),y);
Hesse=[df11 df12;df21 df22];
Hesse=simplify(Hesse);%simple��2014���Ժ�㲻��ʹ�ã���simplify����
ezsurf(f)
figure(2)
subplot(2,2,1),ezsurf(df11)
subplot(2,2,2),ezsurf(df12)
subplot(2,2,3),ezsurf(df21)
subplot(2,2,4),ezsurf(df22)
%����Maple��������Hesse����
disp('����hessian����������õ���Hesse����')
Hesse1=hessian(f,[x,y])

%��άHesse�������
clear
syms x y z
t=(x+y)*exp(z);
hesse3D_jacobian=jacobian(jacobian(t,[x,y,z]),[x,y,z])
hesse3D=hessian(t,[x,y,z])