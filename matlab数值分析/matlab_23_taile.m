%�ڣ�1����
syms x;
y1=exp(x^2)*cos(x)
tay_y1=taylor(y1,'Order',8)
%����ͼ��
subplot(1,2,1),ezplot(y1,[-5,5]),grid
%����չ��������վ���㸽����ͼ��
subplot(1,2,2),ezplot(tay_y1,[-5,5]),grid
%�ڣ�2����
syms x;
y2=1/(x^2-3*x+2);
tay_y2=taylor(y2,'Order',8)
%�ڣ�3����
syms x;
y3=exp(x)
tay_y3=taylor(y3,'Order',8,'ExpansionPoint',2)