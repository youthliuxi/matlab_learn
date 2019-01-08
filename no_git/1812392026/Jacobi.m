%Jacobi.m
function x=Jacobi(A,b,x0,eps,N)
%���ܣ���Jacobi��������n�����Է�����Ax=b.
n=length(b);
x=ones(n,1);
k=0;
while k<=N
    for i=1:n
        x(i)=(b(i)-A(i,[1:i-1,i+1:n])*x0([1:i-1,i+1:n]))/A(i,i);
    end
    k=k+1;
    if norm(x-x0,inf)<eps,break;
    end
    x0=x;
end
if k>N
    Warning('�㷨����������������');
else
    disp(['��������=  ',num2str(k)])
    x
end