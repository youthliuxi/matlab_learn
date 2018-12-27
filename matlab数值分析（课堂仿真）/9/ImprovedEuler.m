% ImprovedEuler.m
% [a,b]为求解区间，h为步长，s为返回向量，u0为初值
function s=ImprovedEuler(fun,a,b,h,u0)
    syms x u;
    n=(b-a)/h;s=zeros(1,n+1);s(1)=u0;
    for k1=1:n
        fk=double(subs(fun,{x,u},{a+(k1-1)*h,s(k1)}));
        fk1=double(subs(fun,{x,u},{a+k1*h,s(k1)+h*fk}));
        s(k1+1)=s(k1)+h/2*(fk+fk1);
    end