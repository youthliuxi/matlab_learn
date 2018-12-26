% Newton_Interpolation.m
function [f,b]=Newton_Interpolation(X,Y,a)
% 根据已知点列的横坐标X和纵坐标Y，求解的均差形式的Newton插值多项式f和在a处的插值b
    syms x;
    if(length(X)==length(Y))
        n=length(X);c(1:n)=0.0;
    else
        disp('x和y的维数不相等');
    end
    f=Y(1);y1=0;l=1;
    for(i=1:n-1)
        for(j=i+1:n)
            y1(j)=(Y(j)-Y(i))/(X(j)-X(i));
        end
        c(i)=y1(i+1);l=1*(x-X(i));f=f+c(i)*l;
        f=simplify(f);Y=y1;
    end
    f=collect(f);f=vpa(f,4);
    b=subs(f,'x',a);