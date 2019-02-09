% 线性规划问题
% 运筹学——数学规划——线性规划
% x代表决策变量，欲求公式f(x)为目标函数，对x的限制分为线性不等式约束、线性等式约束、决策向量上下界三种
% [x,fval]=linprog(f,A,b)
% [x,fval]=linprog(f,A,b,Aeq,beq)
% [x,fval]=linprog(f,A,b,Aeq,beq,lb,ub)
% 其中f,x,b,beq,lb,ub均为列向量；f为价值向量；b为资源向量；A,Aeq为矩阵
% A,b对应线性不等式约束；
% Aeq,beq对应线性不等式约束(不等式约束为<=符号)；
% lb,ub分别对应决策向量的下界向量和上界向量
f=[2;3;-5];
a=[-2,5,-1;1,3,1];
b=[-10;12];
aeq=[1,1,1];
beq=7;
[x,y]=linprog(f,a,b,aeq,beq,zeros(3,1));
x,y=-y