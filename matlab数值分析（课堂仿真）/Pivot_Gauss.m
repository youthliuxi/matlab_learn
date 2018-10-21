%Pivot_Gauss.m
function x=Pivot_Gauss(A,b)
    n=length(b);
    for k=1:n-1
        [max_value,max_index]=max(abs(A(k:n,k)));%步骤2.1（选主元）
        rk=k+max_index-1;
        if max_value==0%步骤2.2
            warning('系数矩阵奇异');
            return;
        end
        if rk~=k%步骤2.3
            t=A(k,:);A(k,:)=A(rk,:);A(rk,:)=t;
            %交换矩阵的第k行和第rk行
            t=b(k);b(k)=b(rk);b(rk)=t;
        end
        for i=k+1:n
            L(i,k)=A(i,k)/A(k,k);
            A(i,k+1:n)=A(i,k+1:n)-L(i,k)*A(k,k+1:n);
            b(i)=b(i)-L(i,k)*b(k);
        end
    end
    if A(n,n)==0
        waring('系数矩阵奇异');
        return;
    end
    %回代求解
    for k=n:-1:1
        if k==n
            x(n)=b(n)/A(n,n);
        else
            x(k)=(b(k)-sum(A(k,k+1:n).*x(k+1:n)))/A(k,k);
        end
    end
end