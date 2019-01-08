%Doolittle.m
function x=Doolittle(A,b)
%���ܣ��ð���ѡ��Ԫ��Dolittle�������n�����Է�����Ax=b.
%����A�ĸ���˳������ʽ����Ϊ��.
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
        %����A�ĵ�k�����q��
        t_A=A(k,:);
        A(k,:)=A(q,:);
        A(q,:)=t_A;
        t_s=s(k);
        s(k)=s(q);
        s(q)=t_s;
        %��A�ĵ�k��ǰk-1��Ԫ�����q�е�ǰk-1��Ԫ�ؽ���
        t_L=L(k,1:k-1);
        L(k,1:k-1)=L(q,1:k-1);
        L(q,1:k-1)=t_L;
        t_b=b(k);
        b(k)=b(q);
        b(q)=t_b;
    end
    U(k,k)=s(k);
    %����U�ĵ�k�У�L�ĵ�k��
    for i=k+1:n
        U(k,i)=A(k,i)-L(k,1:k-1)*U(1:k-1,i);
        L(i,k)=s(i)/U(k,k);
    end
end
U(n,n)=A(n,n)-L(n,1:n-1)*U(1:n-1,n);
%�������Ƿ�����
y=zeros(n,1);
for k=1:n
    if k==1
        y(1)=b(1);
    else
        y(k)=b(k)-L(k,1:k-1)*y(1:k-1);
    end
end
%�������Ƿ�����
x=zeros(n,1);
for k=n:-1:1
    if k==n
        x(n)=y(n)/U(n,n);
    else
        x(k)=(y(k)-U(k,k+1:n)*x(k+1:n))/U(k,k);
    end
end
x=x';