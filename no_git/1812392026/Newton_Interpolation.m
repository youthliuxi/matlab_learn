%Newton_Interpolation.m
function[f,b]=Newton_Interpolation(X,Y,a)
syms x;
if(length(X)==length(Y))
    n=length(X);
    c(1:n)=0.0;
else
    disp('X和Y的维数不相等');
    return;
end
f=Y(1);
y1=0;
l=1;
for (i=1:n-1)
    for (j=i+1:n)
        y1(j)=(Y(j)-Y(i))/(X(j)-X(i));
    end
    c(i)=y1(i+1);
    l=l*(x-X(i));
    f=f+c(i)*l;
    f=simplify(f);
    Y=y1;
end
f=collect(f);
f=vpa(f,4);
b=subs(f,'x',a);