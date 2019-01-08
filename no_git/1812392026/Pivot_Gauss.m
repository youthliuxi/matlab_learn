%Pivot_Gauss.m
function x=Pivot_Gauss(A,b)
%功能 ：用Guass列主元消去法解n阶线性方程组Ax=b.
n=length(b);
for k=1:n-1  
    [max_value,max_index]=max(abs(A(k:n,k)));
    rk=k+max_index-1;
    if max_value==0
        warning('系数矩阵奇异！');
        return;
    end
    if rk~=k
        t=A(k,:);
        A(k,:)=A(rk,:);
        A(rk,:)=t;
        t=b(k);
        b(k)=b(rk);
        b(rk)=t;
    end
    for i=k+1:n
        L(i,k)=A(i,k)/A(k,k);
        A(i,k+1:n)=A(i,k+1:n)-L(i,k)*A(k,k+1:n);
        b(i)=b(i)-L(i,k)*b(k);
    end
end
if A(n,n)==0
    warning('系数矩阵奇异!');
    return;
end
for k=n:-1:1
    if k==n
        x(n)=b(n)/A(n,n);
    else
        x(k)=(b(k)-sum(A(k,k+1:n).*x(k+1:n)))/A(k,k);
    end
end