%题（1） e的展开式
syms x k
s=x^k/sym(factorial(k));
sum_1=symsum(s,k,0,inf)
subplot(2,2,1),fplot(sum_1),grid on
% 题（2） 斯特林公式
syms x n
s=2*x^(2*n-1)/(2*n-1);
sum_2=symsum(s,n,1,inf)
%在第2和4子窗口画出函数图像
subplot(2,2,[2 4]),fplot(sum_2),grid on
%题（3）
syms k
s=(-1)^(k+1)/k;
sym_3=symsum(s,k,1,inf)
%题（4）
syms x n
s=n*(n+1)/2*x^(n-1);
sum_4=symsum(s,n,1,inf)
subplot(2,2,3),fplot(sum_4),grid on
