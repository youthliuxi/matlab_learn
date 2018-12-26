% La_Interpolation.m
function [L,p,b]=Lagrange_Interpolation(X,Y,a)
% 功能：根据已知横坐标向量X和纵坐标向量Y求解n次Lagrange插值多项式L和对应的基函数p，并将a的值带入求解对应的插值b
    if(length(X)==length(Y))
        n=length(X);
    else
        disp('X和Y的维数不相等');
        return;
    end
    n=length(X);L=ones(n,n);
    for k=1:n
        V=1;
        for i=1:n
            if k~=i
                V=conv(V,poly(X(i)))/(X(k)-X(i));
            end
        end
        p(k,:)=poly2sym(V);
    end
    p=collect(p);
    p=vpa(p,4)
    L=vpa(Y*p,4);
    b=polyval(sym2poly(L),a);