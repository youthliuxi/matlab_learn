clear
clc
A=[1 2 -1;-3 1 2;3 -2 1];
b=[1;2;3];
format short g
    n=length(A);L=eye(n);U=zeros(n);
    for k=1:n-1
        fprintf('��%d��ѭ��\n',k)
        if k==1
            for i=k:n
                U(k,i)=A(k,i);
                fprintf('��%d��ѭ��,u%d%d��ֵ�ǣ�%f\n',k,k,i,U(k,i))
                if i==k continue
                end
                L(i,k)=A(i,k)/U(k,k);
                fprintf('��%d��ѭ��,l%d%d��ֵ�ǣ�%f\n',k,i,k,L(i,k))
            end
        else
            for i=k:n
                U(k,i)=A(k,i)-L(i,1:k-1)*U(1:k-1,k);
                fprintf('��%d��ѭ��,u%d%d��ֵ�ǣ�%f\n',k,k,i,U(k,i))
                if i==k continue
                end
                L(i,k)=(A(i,k)-L(i,1:k-1)*U(1:k-1,k))/U(k,k);
                fprintf('��%d��ѭ��,l%d%d��ֵ�ǣ�%f\n',k,i,k,L(i,k))
            end
        end
                    
    end
    U(n,n)=A(n,n)-L(n,1:n-1)*U(1:n-1,n);
    fprintf('���u%d%d��ֵ��%f\n',n,n,U(n,n))
    U
    L
    %�������Ƿ�����
    y=zeros(n,1);
    for k=1:n
        if k==1
            y(1)=b(1);
            fprintf('y%d��ֵ�ǣ�%f',1, y(1))
        else
            y(k)=b(k)-L(k,1:k-1)*y(1:k-1);
            fprintf('y%d��ֵ�ǣ�%f',1, y(k))
        end
        y
    end
    %�������Ƿ�����
    x=zeros(n,1);
    for k=n:-1:1
        if k==n
            x(n)=y(n)/U(n,n);
            fprintf('x%d��ֵ�ǣ�%f',n, x(n))
        else
            x(k)=(y(k)-U(k,k+1:n)*x(k+1:n))/U(k,k);
            fprintf('x%d��ֵ�ǣ�%f',k, x(k))
        end
        x
    end
    x=x'