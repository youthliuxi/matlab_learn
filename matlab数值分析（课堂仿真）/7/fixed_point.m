% fixed_point.m
function [k,x]=fixed_point(phi,x0,eps,N)
    % 功能：用不动点迭代法求解方程x=f(x)
    fprintf('k  x\n');
    for k=1:N
        x=phi(x0);
        fprintf('%3d,  %10.9f',k,x)
        if abs(x-x0)<eps
            return
        else
            x0=x;
            if k==N
                warning('算法超过最大迭代次数！')
            end
        end
    end