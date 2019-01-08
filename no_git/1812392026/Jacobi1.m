%Jacobi1.m
function x=Jacobi1(A,b,x0,eps,N)
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
    disp(['��������=',num2str(k)])
    x;
end
%�жϾ���A�Ƿ�Ϊ�ϸ�Խ�ռ�ž���
B=abs(A);
m=1;
for i=1:n
    d=B(i,i);
    q=sum(B,2)-d;
    if d<=q;
        m=0;
    end
end
if m==1
   disp(['A���ϸ�Խ�ռ�ž���']); 
else
    disp(['A�����ϸ�Խ�ռ�ž���']);
end 