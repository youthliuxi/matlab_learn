%Jacobi1.m
function x=Jacobi1(A,b,x0,eps,N)
%功能：用Jacobi迭代法解n阶线性方程组Ax=b.
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
    Warning('算法超出最大迭代次数！');
else
    disp(['迭代次数=',num2str(k)])
    x;
end
%判断矩阵A是否为严格对角占优矩阵
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
   disp(['A是严格对角占优矩阵']); 
else
    disp(['A不是严格对角占优矩阵']);
end 