%�����ĵ�����߽׵�������
%������1��
syms x;
f1=(1+sin(x))/(1-cos(x));
%���㵼��
df1=diff(f1,x)
%�Ѵ��ڲ��Ϊ�����Ӵ��ڻ�ͼ
subplot(1,2,1),ezplot(f1),grid on
subplot(1,2,2),ezplot(df1),grid on

%������2��
syms x;
y1=asin(x);
y2=acos(x);
y3=atan(x);
y4=acot(x);
%�������ž���
y=[y1 y2;y3 y4];
%������ž�����
dy=diff(y)
figure(2)
%�Ѵ��ڲ�ֳ���С�񣬻���������ͼ��
subplot(2,2,1),ezplot(y1),grid
subplot(2,2,2),ezplot(y2),grid
subplot(2,2,3),ezplot(y3),grid
subplot(2,2,4),ezplot(y4),grid
%�½����ڣ���������������ͼ��
figure(3)
subplot(2,2,1),ezplot(dy(1)),grid
subplot(2,2,2),ezplot(dy(2)),grid
subplot(2,2,3),ezplot(dy(3)),grid
subplot(2,2,4),ezplot(dy(4)),grid

%������3��
syms x;
z=x^2*cos(x);
dz8=diff(z,x,8)
%�½����ڣ���������ͼ��
figure(4)
subplot(1,2,1),ezplot(z),grid
subplot(1,2,2),ezplot(dz8),grid