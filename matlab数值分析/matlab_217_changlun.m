%�����е��ݶȡ�ɢ�Ⱥ�����
%��һ��
syms x y z
f=log(x^2+y^2+z^2);
grad_1=[diff(f,x),diff(f,y),diff(f,z)];
disp('u���ݶ�һ����ʽ');
grad_1=simplify(grad_1)
%��������Ϊ���ţ�������������ݶ�
disp('u�ڵ㣨1,2��-2�������ݶ�Ϊ��')
grad_2=subs(grad_1,{x,y,z},{sym('1'),syms('2'),sym('-2')})

%�ڶ���
syms x y z
P=x^2*y*z;
Q=x*y^2*z;
R=x*y*z^2;
%����ɢ�Ⱥ�����
div_1=diff(P,x)+diff(Q,y)+diff(R,z);
rot_1=[diff(R,y)-diff(Q,z),diff(P,z)-diff(R,x),diff(Q,x)-diff(P,y)];
%����
disp('������A��ɢ�ȣ�')
div_2=simplify(div_1)
disp('������A�����ȣ�')
rot_2=simplify(rot_1)