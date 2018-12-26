% Gauss_Seidel.m
function x=Gauss_Seidel(A,b,x0,eps,N)
% ���ܣ���Gauss_Seidel��������n�����Է�����Ax=b
    n=length(b);x=ones(n,1);k=0;
    while k<=N
        for i=1:n
            x(i)=(-A(i,[1:i-1])*x([1:i-1])-A(i,[i+1:n])*x0([i+1:n])+b(i))/A(i,i);
        end
        k=k+1;
        if norm(x-x0,inf)<eps,break;end
        x0=x;
    end
    if k>N,
        Warning('�㷨��������������');
    else
        disp(['��������= ',num2str(k)])
        x
    end