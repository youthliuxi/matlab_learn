%�������뷴����������
syms x;
%��1��
y1=x/(1+cos(2*x));
int_y1=int(y1,x,0,pi/4)
%�ڵ�һ��figure�У���һ���Ի��滭��ԭ����ͼ��
subplot(1,2,1),ezplot(y1),grid on

%��2��
y2=x*(1-x^4)^(3/2);
int_y2=int(y2,x,0,1);
subplot(1,2,2),ezplot(y2),grid on

%��3�� ��������
y3=1/(x+7)/sqrt(x-2);
int_y3=int(y3,x,2,inf)
figure(2)
subplot(1,2,1),ezplot(y3),grid on
%��4�� 覻���
y4=1/sqrt(1-x^2)
int_y4=int(y4,x,0,1)
subplot(1,2,2),ezplot(y4),grid on
