function [k,x]=SNLENewton(F,DF,x0,eps,N)
    % ���ܣ���Newton���������Է�����F(x)=0
    fprintf('k x||x^k-x{k-1}||\n');
    for k=1:N
        F_value=F(x0);
        DF_value=DF(x0);
        y=DF_value\(-F_value);
        x=x0+y;
        norm_y=norm(y);
        fprintf('%3d,   %10.9f, %10.9f\t',k,x,norm_y)
        fprintf('\n')
        if norm_y<eps
            return
        else
            x0=x;
            if k==N
                warning('�㷨����������������')
            end
        end
    end