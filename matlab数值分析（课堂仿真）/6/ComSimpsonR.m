% ComSimpsonR.m
% a,b为积分限，n为区间等分数，s为返回积分值，fun为被积函数
function s=ComSimpsonR(fun,a,b,n)
    syms x;% 函数变量
    h=(b-a)/n;% 求步长
    xvalue=zeros(1:n+1);
    xvalue(1)=a;
    for k1=1:n% 求节点
        xvalue(k1+1)=xvalue(k1)+h;
    end
    yvalue=zeros(1:n+1);
    for k2=1:(n+1)% 求节点函数值
        yvalue(k2)=double(subs(fun,x,xvalue(k2)));
    end
    s=h/3*(yvalue(1)-yvalue(n+1));% 给出初始迭代值
    for k3=1:n/2% 利用复化Simpson公式求积分
        s=h/3*(2*yvalue(2*k3+1)+4*yvalue(2*k3))+s;
    end