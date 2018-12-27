% FourRungeKutta.m
% [a,b]为求解区间，h为步长，s为返回向量，u0为初值
function s=FourRungeKutta(fun,a,b,h,u0)
    syms x u;
    n=(b-a)/h;s=zeros(1,n+1);s(1)=u0;
    x1=a:h:b;
    for nn=1:n
        K1=double(subs(fun,{x,u},{x1(nn),s(nn)}));
        K2=double(subs(fun,{x,u},{x1(nn)+h/2,s(nn)+h/2*K1}));
        K3=double(subs(fun,{x,u},{x1(nn)+h/2,s(nn)+h/2*K2}));
        K4=double(subs(fun,{x,u},{x1(nn)+h,s(nn)*K3}));
        s(nn+1)=s(nn)+h/6*(K1+2*K2+2*K3+K4);
    end