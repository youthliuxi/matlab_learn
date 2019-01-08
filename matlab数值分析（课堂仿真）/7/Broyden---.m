% Broyden.m
function [k,x]=Broyden(F,DF,x,eps,N)
    % 功能：用Broyden法求解非线性方程组F(x)=0
    H0=DF(x);
    v=inv(H0);
    s=-H*v;
    x=x+s;
    fprintf('k x ||x^k-x^{k-1}||\n');
    fprintf('%3d,   %10.9f, %10.9f\t',1,x,norm(s))
    fprintf('\n')
    for k=2:N
        w=v;
        v=F(x);
        y=v-w;
        z=-H*y;
        p=-s'*z;
        u=s'*H;
        u=u';
        H=H+(1/p)*(s+z)*u';
        s=-H*v;
        x=x+s;
        norm_s=norm(s);
        fprintf('%3d,   %10.9f, %10.9f\t',k,x,norm_s)
        fprintf('\n')
        if norm_s<eps
            return
        else
            if k==N
                warning('算法超出最大迭代次数！')
            end
        end
    end