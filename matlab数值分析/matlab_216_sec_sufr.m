%�ڶ����������
%��һ��
syms theta fa;
syms h a positive;
%����Ĳ�������
x=a*sin(fa)*cos(theta);
y=a*sin(fa)*sin(theta);
z=a*cos(fa);
%����C
C=diff(x,fa)*diff(y,theta)-diff(x,theta)*diff(y,fa);
C=simplify(C);
%z����ĺ���
Fz=z;
int1=int(Fz*C,fa,0,pi);
int2=int(int1,theta,0,pi*2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������������ĺ���ͼ��
a=5;
x=a*sin(fa)*cos(theta);
y=a*sin(fa)*sin(theta);
z=a*cos(fa);
ezmesh (x,y,z,[0,pi,0,2*pi])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%�ڶ���
syms a theta z
x=a*cos(theta);
y=a*sin(theta);
%����A,B,C
A=a*cos(theta);
B=a*sin(theta);
C=0;
%��������������
Fx=x;
Fy=y;
Fz=z;
%���������귽�����
int_x=int(int(Fx*A,theta,0,2*pi),z,-h,h);
int_y=int(int(Fy*B,theta,0,2*pi),z,-h,h);
int_z=int(int(Fz*C,theta,0,2*pi),z,-h,h);
%����֮��
int_2=int_x+int_y+int_z