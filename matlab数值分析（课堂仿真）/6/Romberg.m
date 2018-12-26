% Romberg.m
% a,b为积分限，epsilon为精度，s为返回积分值，fun为被积函数
% R(n,m)表示计算值，(n-1)为变步长指标，(m-1)为加速次数
function s=Romberg(fun,a,b,epsilon)
    syms x;
    fvalue=zeros(1,1000);
    R=zeros(100,100);
    fvaluea=double(subs(fun,x,a));
    fvalueb=double(subs(fun,x,b));
    R(1,1)=(b-a)/2*(fvaluea+fvalueb);% 梯形公式
    km=1;
    for k1=1:100% 设置一个比较大的循环量
        h=(b-a)/(2^(k1));
        R(k1+1,1)=1/2*R(k1,1);
        for k2=1:2^(k1-1)
            fvalue(2*k2)=double(subs(fun,x,a+(2*k2-1)*h));
            R(k1+1,1)=h*fvalue(2*k2)+R(k1+1,1);% 变步长值
        end
        for k3=1:km
            R(k1+1,k3+1)=1/(4^(k3)-1)*(4^(k3)*R(k1+1,k3)-R(k1,k3));
        end
        if abs(R(k1+1,km+1)-R(k1+1,km))<epsilon % 精度控制
            s=R(k1+1,km+1);
            break;
        else
            km=km+1;
        end
    end