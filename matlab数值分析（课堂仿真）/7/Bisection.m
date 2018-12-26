% Bisection.m
function [k,x,f_value]=Bisection(f,a,b,eps1,eps2,N)
    fprintf('k a b x f\n');
    for k=1:N
        x=(a+b)/2;
        f_value=f(x);
        fprintf('%3d, %10.9f, %10.9f, %10.9f, %10.9f\n', k, a, b, x, f_value)
        if abs(f_value)<eps1 | 0.5*(b-a)<eps2
            return
        else
            if f(x)*f(a)<0
                b=x;
            else
                a=x;
            end
            if k==N
                warning('算法超出最大迭代次数！')
            end
        end
    end