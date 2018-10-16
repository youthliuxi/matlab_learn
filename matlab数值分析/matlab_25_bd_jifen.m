%样例
syms x a
int(x*a);
%int(S,v)
%int(S,v,Name,Value)
syms x
%第（1）题
y1=(log(x)-1)/x^2;
int_y1=int(y1)
%用符号作图法作出函数图像
subplot(1,2,1),ezplot(y1),grid on
%在另一子窗口，用符号作图法作出原函数图像，积分常数取0
subplot(1,2,2),ezplot(int_y1),grid on
%第（2）题
y2=exp(2*x)*(tan(x)+1)^2;
int_y2=int(y2)
figure(2)
%用符号作图法作出函数图像
subplot(1,2,1),ezplot(y2),grid on
%在另一子窗口，用符号作图法作出原函数图像，积分常数取0
subplot(1,2,2),ezplot(int_y2),grid on
%第（3）题 不可积分范例
y3=exp(x^(-2));
int_y3=int(y3)
%第（4）题 另一种不可积分范例
y4=sin(x)/x
int_y4=int(y4)