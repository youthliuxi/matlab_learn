%fixed_point.m
function[k,x]=fixed_point(phi,x0,eps,N)
fprintf('k  x\n');
for k=1:N
    x=phi(x0);
    fprintf('%3d,%10.9f\n',k,x)
    if abs(x-x0)<eps
        return
    else
        x0=x;
        if k==N
            warning('算法超出最大迭代次数！')
        end
    end
end