function[x]=gauss(A,b)
% A为系数矩阵且必须为方阵
% b为常数项向量
n=size(A,1);
x=zeros(1,n);
for i=1:n-1
    if(A(i,i)==0)
        t=find(A(i+1:n,1)~=0+i, 1 );
        if(isempty(t))
            disp('Gauss_elim error:A matrix is signular');
            return
        end;
        temp=A(i,:);
        tb=b(i);
        A(i,:)=A(t,:);
        b(i)=b(t);
        A(t,:)=temp;
        b(t)=tb;
    end;
    for k=i+1:n
        m=-A(k,i)/A(i,i);
        A(k,i)=0;
        A(k,i+1:n)=A(k,i+1:n)+m*A(i,i+1:n);
        b(k)=b(k)+m*b(i);
    end
end
x(n)=b(n)/A(n,n);
for i=n-1:-1:1
    x(i)=(b(i)-sum(x(i+1:n).*A(i,i+1:n)))/A(i,i);
end