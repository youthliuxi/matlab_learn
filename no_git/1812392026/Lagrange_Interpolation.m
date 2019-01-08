%La_Interpolation.m
function[L,p,b]=Lagrange_Interpolation(X,Y,a)
if(length(X)==length(Y))
    n=length(X);
else
    disp('X和Y的维数不相等');
    return;
end
n=length(X);
L=ones(n,n);
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
p=vpa(p,4);
L=vpa(Y*p,4);
b=polyval(sym2poly(L),a);
        