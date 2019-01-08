function y = divided_linear(x0,y0,x,n)
for i= 1:n+1
    if(x>=x0(i))&&(x<=x0(i+1))
        y =(x- x0(i+1))/(x0(i)- x0(i+1))*y0(i)+ ((x- x0(i))/(x0(i+1)- x0(i))*y0(i+1))
    else
        continue;
    end
end

