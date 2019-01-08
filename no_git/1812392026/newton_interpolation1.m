%newton_interpolation.m
function b=newton_interpolation1(x,y,a)
n=length(y);
c=y(:);
for j=2:n
    for i=n:-1:j
        c(i)=(c(i)-c(i-1))/(x(i)-x(i-j+1));
    end
end
s=c(n);
for i=n-1:-1:1
    s=s*(a-x(i))+c(i);
end
b=s