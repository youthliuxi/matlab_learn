syms x
y=x^3+6*x^2+8*x-1;dy=diff(y);
dy_zero=solve(dy),dy_zero_num=double(dy_zero)
% g=solve(eq1,eq2,��,eqn,var1,var2,��,varn)
% var1,var2,��,varnΪָ�����������Է�����eq1,eq2,��,eqn��ָ����n������var1,var2,��,varn���
ezplot(y) % 