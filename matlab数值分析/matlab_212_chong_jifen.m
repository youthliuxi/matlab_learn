%�ػ�������
%��һ�� ���ػ��ֵ�����
syms x y
z=exp(x^2);
%�ۼƻ��ַ������ػ���
int1=int(z,y,x^3,x);
int_z=int(int1,x,0,1)

%�ڶ��� ���ػ��ֵ�����
syms x y z a b c
f=x;
int1=int(f,z,0,c*(1-x/a-y/b));
int2=int(int1,y,0,b*(1-x/a));
int_f=int(int2,x,0,a)