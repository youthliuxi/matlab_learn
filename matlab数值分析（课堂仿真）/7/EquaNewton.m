% EquaNewton.m
function [k,x,f_value]=EquaNewton(f,Df,x0,eps,N)
    % 功能：用Newton迭代法求解方程f(x)=0
    fprintf('k, x,  f\n');
    f_value=f(x0);
    for k=1:N
        x=x0-f_value/Df(x0);
        f_value=f(x0);
        fprintf('%3d,   %12.11d,    %12.11f\n',k,x,f_value)
        if abs(x-x0)<eps
            return
        else
            x0=x;
            if k==N
                warning('算法超过最大迭代次数！')
            end
        end
    end