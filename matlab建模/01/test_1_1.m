f=[-3;1;1];
a=[1,-2,1;4,-1,-2];
b=[11;-3];
aeq=[-2,0,1];
beq=1;
[x,y]=linprog(f,a,b,aeq,beq,zeros(3,1));
x,y=-y