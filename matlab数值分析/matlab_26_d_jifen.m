%定积分与反常积分运算
syms x;
%第1题
y1=x/(1+cos(2*x));
int_y1=int(y1,x,0,pi/4)
%在第一幅figure中，第一个自画面画出原函数图像
subplot(1,2,1),ezplot(y1),grid on

%第2题
y2=x*(1-x^4)^(3/2);
int_y2=int(y2,x,0,1);
subplot(1,2,2),ezplot(y2),grid on

%第3题 反常积分
y3=1/(x+7)/sqrt(x-2);
int_y3=int(y3,x,2,inf)
figure(2)
subplot(1,2,1),ezplot(y3),grid on
%第4题 瑕积分
y4=1/sqrt(1-x^2)
int_y4=int(y4,x,0,1)
subplot(1,2,2),ezplot(y4),grid on
