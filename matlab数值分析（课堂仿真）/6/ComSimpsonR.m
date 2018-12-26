% ComSimpsonR.m
% a,bΪ�����ޣ�nΪ����ȷ�����sΪ���ػ���ֵ��funΪ��������
function s=ComSimpsonR(fun,a,b,n)
    syms x;% ��������
    h=(b-a)/n;% �󲽳�
    xvalue=zeros(1:n+1);
    xvalue(1)=a;
    for k1=1:n% ��ڵ�
        xvalue(k1+1)=xvalue(k1)+h;
    end
    yvalue=zeros(1:n+1);
    for k2=1:(n+1)% ��ڵ㺯��ֵ
        yvalue(k2)=double(subs(fun,x,xvalue(k2)));
    end
    s=h/3*(yvalue(1)-yvalue(n+1));% ������ʼ����ֵ
    for k3=1:n/2% ���ø���Simpson��ʽ�����
        s=h/3*(2*yvalue(2*k3+1)+4*yvalue(2*k3))+s;
    end