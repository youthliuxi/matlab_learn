%��һ���������
%��һ��
syms x y z
z=1-x-y;
ds=sqrt(1+diff(z,x)^2+diff(z,y)^2);
%�ܶȺ���
f=x*y*z
int1=int(f*ds,y,0,1-x);
int_1=int(int1,x,0,1)

%�ڶ���
clear
syms rou theta;
%��������
x=rou*cos(theta);
y=rou*sin(theta);
z=rou;
%�ֱ�����E,G,F
E=diff(x,rou)^2+diff(y,rou)^2+diff(z,rou)^2;
