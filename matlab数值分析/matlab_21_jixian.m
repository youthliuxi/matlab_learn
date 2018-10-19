%函数极限运算
syms x;
y1=(1-sqrt(1-x^2))/(exp(x)-cos(x));
disp('第一题结果是：')
lim_yi=limit(y1,x,0)
subplot(2,2,1),ezplot(y1,[-4,4]),grid on,title('(1)')
syms x;
y2=(1-exp(1/x))/(x+exp(1/x));
disp('第二题结果是：')
lim_yi=limit(y2,x,0,'right')
subplot(2,2,2),ezplot(y2,[-4,4]),grid on,title('(2)')
syms x a b;
y3=(a^x/2+b^x/2)^(3/x);
disp('第三题结果是：')
lim_y3=limit(y3,x,0)
syms x;
y4=(3*x^2+5)/(5*x+3)*sin(2/x);
disp('第四题结果是：')
lim_y4=limit(y4,x,inf)
y5=1/x^2-1/x/tan(x);
disp('第五题结果是：')
lim_y5=limit(y5,x,0)
subplot(2,2,3:4),ezplot(y5,[0,2]),grid on,title('(5)')
