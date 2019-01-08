%Doolittle.m
function x=Doolittle(A,b)
%功能：用按列选主元的Dolittle方法求解n阶线性方程组Ax=b.
%假设A的各阶顺序主子式均不为零.
n=length(A);
L=eye(n);
U=zeros(n);
for k=1:n-1
    for i=k:n
        s(i)=A(i,k)-L(i,1:k-1)*U(1:k-1,k);
    end
    [~,q]=max(abs(s(k:n)));
    q=q+k-1;
    if q>k
        %交换A的第k行与第q行
        t_A=A(k,:);
        A(k,:)=A(q,:);
        A(q,:)=t_A;
        t_s=s(k);
        s(k)=s(q);
        s(q)=t_s;
        %将A的第k行前k-1个元素与第q行的前k-1个元素交换
        t_L=L(k,1:k-1);
        L(k,1:k-1)=L(q,1:k-1);
        L(q,1:k-1)=t_L;
        t_b=b(k);
        b(k)=b(q);
        b(q)=t_b;
    end
    U(k,k)=s(k);
    %计算U的第k行，L的第k行
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