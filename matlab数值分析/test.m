syms x
y=x^3+6*x^2+8*x-1;dy=diff(y);
dy_zero=solve(dy),dy_zero_num=double(dy_zero)
% g=solve(eq1,eq2,…,eqn,var1,var2,…,varn)
% var1,var2,…,varn为指定变量，即对方程组eq1,eq2,…,eqn中指定的n个变量var1,var2,…,varn求解
ezplot(y) % 