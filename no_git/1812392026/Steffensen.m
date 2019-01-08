%Steffensen.m
function[k,x]=Steffensen(phi,x0,eps,N)
fprintf('k    x\n');
for k=1:N
    y=phi(x0);
    z=phi(y);
    x=x0-(y-x0)^2/(z-2*y+x0);
    fprintf('%3d,%10.9f\n',k,x)
    if abs(x-x0)<eps
        return
    else
        x0=x;
        if k==N
            warning('算法超过最大迭代次数！')
        end
    end
end