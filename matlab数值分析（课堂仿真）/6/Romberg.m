% Romberg.m
% a,bΪ�����ޣ�epsilonΪ���ȣ�sΪ���ػ���ֵ��funΪ��������
% R(n,m)��ʾ����ֵ��(n-1)Ϊ�䲽��ָ�꣬(m-1)Ϊ���ٴ���
function s=Romberg(fun,a,b,epsilon)
    syms x;
    fvalue=zeros(1,1000);
    R=zeros(100,100);
    fvaluea=double(subs(fun,x,a));
    fvalueb=double(subs(fun,x,b));
    R(1,1)=(b-a)/2*(fvaluea+fvalueb);% ���ι�ʽ
    km=1;
    for k1=1:100% ����һ���Ƚϴ��ѭ����
        h=(b-a)/(2^(k1));
        R(k1+1,1)=1/2*R(k1,1);
        for k2=1:2^(k1-1)
            fvalue(2*k2)=double(subs(fun,x,a+(2*k2-1)*h));
            R(k1+1,1)=h*fvalue(2*k2)+R(k1+1,1);% �䲽��ֵ
        end
        for k3=1:km
            R(k1+1,k3+1)=1/(4^(k3)-1)*(4^(k3)*R(k1+1,k3)-R(k1,k3));
        end
        if abs(R(k1+1,km+1)-R(k1+1,km))<epsilon % ���ȿ���
            s=R(k1+1,km+1);
            break;
        else
            km=km+1;
        end
    end