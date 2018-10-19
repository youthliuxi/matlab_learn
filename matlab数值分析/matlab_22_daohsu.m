%函数的导数与高阶导数运算
%范例（1）
syms x;
f1=(1+sin(x))/(1-cos(x));
%计算导数
df1=diff(f1,x)
%把窗口拆分为两个子窗口绘图
subplot(1,2,1),ezplot(f1),grid on
subplot(1,2,2),ezplot(df1),grid on

%范例（2）
syms x;
y1=asin(x);
y2=acos(x);
y3=atan(x);
y4=acot(x);
%建立符号矩阵
y=[y1 y2;y3 y4];
%计算符号矩阵导数
dy=diff(y)
figure(2)
%把窗口拆分成四小格，画出矩阵函数图像
subplot(2,2,1),ezplot(y1),grid
subplot(2,2,2),ezplot(y2),grid
subplot(2,2,3),ezplot(y3),grid
subplot(2,2,4),ezplot(y4),grid
%新建窗口，画出矩阵函数导数图像
figure(3)
subplot(2,2,1),ezplot(dy(1)),grid
subplot(2,2,2),ezplot(dy(2)),grid
subplot(2,2,3),ezplot(dy(3)),grid
subplot(2,2,4),ezplot(dy(4)),grid

%范例（3）
syms x;
z=x^2*cos(x);
dz8=diff(z,x,8)
%新建窗口，画出函数图像
figure(4)
subplot(1,2,1),ezplot(z),grid
subplot(1,2,2),ezplot(dz8),grid