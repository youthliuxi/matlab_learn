%��Ԫ������ƫ��������
syms x y;
%��һ��
z=exp(sin(x*y));
%����x��ƫ����
dzx=diff(z,x)
%����y��ƫ����
dzy=diff(z,y)
%�ȶ�x��ƫ���������y��ƫ����
dzxy=diff(dzx,y)
%��ͼ
subplot(2,2,1),ezsurf(z)
subplot(2,2,2),ezsurf(dzx)
subplot(2,2,3),ezsurf(dzy)
subplot(2,2,4),ezsurf(dzxy)