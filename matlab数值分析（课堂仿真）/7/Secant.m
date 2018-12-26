% Secant.m
function [k,x,f_value]=Secant(f,x0,x1,eps,N)
    % 功能：用割线法求解方程f(x)=0
    q0=f(x0);
    q1=f(x1);
    fprintf('k  x   f\n');
    for k=2:N
        x=x1-(q1*(x1-x0))/(q1-q0);
        f_value=f(x);
        fprintf('%3d,   %12.11f,    %12.11f\n',k,x,f_value)
        if abs(x-x1)<eps
            return
        else
            x0=x1;
            q0=q1;
            x1=x;
            q1=f_value;
            if k==N
                warning('Maximum number of iterations exceeded!')
            end
        end
    end