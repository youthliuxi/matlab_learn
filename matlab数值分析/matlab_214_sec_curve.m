%�ڶ������߻���
%��һ��
syms a t x y z
syms b positive
%���߻��ֲ�������
x=a*cos(t);
y=a*sin(t);
z=b*t;
%����������
F=[x*y,x-y,x^2];
ds=[diff(x),diff(y),diff(z)]';
int_curvel=int(F*ds,t,0,pi)

%�ڶ���
syms t x y z
syms b positive
%���߻��ֲ�������
x=a*cos(t);
y=a*sin(t);
z=b*t;
%����������
F=[x*y,x-y,x^2];
F=[y,-x,x+y+z]
ds=[diff(x),diff(y),diff(z)]';
int_curvel=int(F*ds,t,0,pi)

%%%%%%%%%%%%%%%%%%%%%%
%�ٷֺ��ڲ���Ϊ��ͼ���֣����������Ļ���·��
%Ϊ�˻���ͼ����Ҫ��a,b����ֵ
a=3;b=3;
x=a*cos(t);
y=a*sin(t);
z=b*t;
ezplot3(x,y,z,[0,2*pi])
%%%%%%%%%%%%%%%%%%%%%%