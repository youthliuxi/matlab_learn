% AdamsBAM.m
% [a,b]为求解区间，h为步长，s为返回向量，u0为初值
function s=AdamsBAM(fun,a,b,h,u0)
    syms x u;
    n=(b-a)/h;
    x1=a:h:b;
    s=zeros(1,n+1);
    s(1)=u0;
    dfun2=diff(fun,x,1)+diff(fun,u,1)*fun;
    dfun3=diff(dfun2,x,1)+diff(dfun2,u,1)*fun;
    dfun4=diff(dfun3,x,1)+diff(dfun3,u,1)*fun;
    for mm=1:3;% 四阶Taylor公式计算u1,u2,u3
        du1=double(subs(fun,{x,u},{x1(mm),s(mm)}));
        du2=double(subs(dfun2,{x,u},{x1(mm),s(mm)}));
        du3=double(subs(dfun3,{x,u},{x1(mm),s(mm)}));
        du4=double(subs(dfun4,{x,u},{x1(mm),s(mm)}));
        s(mm+1)=s(mm)+h*du1+h^(2)/2*du2+h^(3)/6*du3+h^(4)/24*du4;
    end
    for nn=4:n% 预测与校正
        fk3=-2*x1(nn)*s(nn)^(2);
        fk2=-2*x1(nn-1)*s(nn-1)^(2);
        fk1=-2*x1(nn-2)*s(nn-2)^(2);
        fk=-2*x1(nn-3)*s(nn-3)^(2);
        uyuce(nn+1)=s(nn)+h/24*(55*fk3-59*fk2+37*fk1-9*fk);
        fkj=-2*x1(nn+1)*uyuce(nn+1)^(2);
        s(nn+1)=s(nn)+h/24*(9*fkj+19*fk3-5*fk2+fk1);
    end