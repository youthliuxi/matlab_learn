%Doolittle.m
function x=Doolittle_2(A,b)
%功能：用Doolittle方法求解n阶线性方程组Ax=b
%假设A的各阶主子式均不为零
    n=length(A);L=eye(n);U=zeros(n);
    for k=1:n-1
        for i=k:n
            s(i)=A(i,k)-L(i,1:k-1)*U(1:k-1,k);
        end
        U(k,k)=s(k);
        %计算U的第k行，L的第k列
        for i=k+1:n
            U(k,i)=A(k,i)-L(k,1:k-1)*U(1:k-1,i);
            L(i,k)=s(i)/U(k,k);
        end
    end
    U(n,n)=A(n,n)-L(n,1:n-1)*U(1:n-1,n);
    %解下三角方程组
    y=zeros(n,1);
    for k=1:n
        if k==1
            y(1)=b(1);
        else
            y(k)=b(k)-L(k,1:k-1)*y(1:k-1);
        end
    end
    %解上三角方程组
    x=zeros(n,1);
    for k=n:-1:1
        if k==n
            x(n)=y(n)/U(n,n);
        else
            x(k)=(y(k)-U(k,k+1:n)*x(k+1:n))/U(k,k);
        end
    end
    x=x';
end