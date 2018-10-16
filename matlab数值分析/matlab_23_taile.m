%第（1）题
syms x;
y1=exp(x^2)*cos(x)
tay_y1=taylor(y1,'Order',8)
%画出图像
subplot(1,2,1),ezplot(y1,[-5,5]),grid
%画出展开级数在站开点附近的图像
subplot(1,2,2),ezplot(tay_y1,[-5,5]),grid
%第（2）题
syms x;
y2=1/(x^2-3*x+2);
tay_y2=taylor(y2,'Order',8)
%第（3）题
syms x;
y3=exp(x)
tay_y3=taylor(y3,'Order',8,'ExpansionPoint',2)