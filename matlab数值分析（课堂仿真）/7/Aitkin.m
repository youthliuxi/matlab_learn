function [k,x] = Aitkin(phi,x0,eps,N)
fprintf('k         x\n');
for k= 1:N
    x1=phi(x0);
    x2=phi(x1);
    x=x0- (x1- x0)^2/(x2- 2* x1+ x0);
    fprintf('%3d,   %8.6f\n',k,x)
    if abs(x- x0)<eps
        return
    else 
        x0= x;
        if k==N
            warning('算法超过最大迭代次数！')
        end
    end
end

