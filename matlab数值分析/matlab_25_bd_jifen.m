%����
syms x a
int(x*a);
%int(S,v)
%int(S,v,Name,Value)
syms x
%�ڣ�1����
y1=(log(x)-1)/x^2;
int_y1=int(y1)
%�÷�����ͼ����������ͼ��
subplot(1,2,1),ezplot(y1),grid on
%����һ�Ӵ��ڣ��÷�����ͼ������ԭ����ͼ�񣬻��ֳ���ȡ0
subplot(1,2,2),ezplot(int_y1),grid on
%�ڣ�2����
y2=exp(2*x)*(tan(x)+1)^2;
int_y2=int(y2)
figure(2)
%�÷�����ͼ����������ͼ��
subplot(1,2,1),ezplot(y2),grid on
%����һ�Ӵ��ڣ��÷�����ͼ������ԭ����ͼ�񣬻��ֳ���ȡ0
subplot(1,2,2),ezplot(int_y2),grid on
%�ڣ�3���� ���ɻ��ַ���
y3=exp(x^(-2));
int_y3=int(y3)
%�ڣ�4���� ��һ�ֲ��ɻ��ַ���
y4=sin(x)/x
int_y4=int(y4)