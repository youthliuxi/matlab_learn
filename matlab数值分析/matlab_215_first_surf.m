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
F=diff(x,rou)*diff(y,theta)+diff(y,rou)*diff(y,theta)+diff(z,rou)*diff(z,theta);
G=diff(x,theta)^2+diff(y,theta)^2+diff(z,theta)^2;
%�ֱ��E��F��G����
E=simplify(E);
F=simplify(F);
G=simplify(G);
%���΢Ԫ
ds=simplify(sqrt(E*G-F*F));
%��������
f=x*y+y*z+z*x;
int1=int(f*ds,rou,0,sin(theta));
int_2=int(int1,theta,0,pi);
%����Բ׶�溯��ͼ��
syms x y
z=sqrt(x^2+y^2);
ezsurf(z,'circ')