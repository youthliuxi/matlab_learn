%RBF identification
clear all;
close all;

alfa=0.05;
xite=0.5;      
x=[0,0]';

b=1.5*ones(4,1);   
c=0.5*ones(2,4);   
w=rands(4,1);   

w_1=w;w_2=w_1;
c_1=c;c_2=c_1;
b_1=b;b_2=b_1;
d_w=0*w;
d_b=0*b;
y_1=0;

ts=0.001;
for k=1:1:2000
   
time(k)=k*ts;
u(k)=0.50*sin(1*2*pi*k*ts);

y(k)=u(k)^3+y_1/(1+y_1^2);  

x(1)=u(k);
x(2)=y_1;
   
for j=1:1:4
    h(j)=exp(-norm(x-c(:,j))^2/(2*b(j)*b(j)));
end
ym(k)=w'*h';
em(k)=y(k)-ym(k);

for j=1:1:4
   d_w(j)=xite*em(k)*h(j);
   d_b(j)=xite*em(k)*w(j)*h(j)*(b(j)^-3)*norm(x-c(:,j))^2;
  for i=1:1:2
   d_c(i,j)=xite*em(k)*w(j)*h(j)*(x(i)-c(i,j))*(b(j)^-2);
  end
end
   w=w_1+ d_w+alfa*(w_1-w_2);
   b=b_1+d_b+alfa*(b_1-b_2);
   c=c_1+d_c+alfa*(c_1-c_2);
   
%%%%%%%%%%%%%%%%%%%Jacobian%%%%%%%%%%%%%%%%%%%%
yu=0;
for j=1:1:4
yu=yu+w(j)*h(j)*(c(1,j)-x(1))/b(j)^2; 
end
dyu(k)=yu;

y_1=y(k);
   
w_2=w_1;
w_1=w;
   
c_2=c_1;
c_1=c;
   
b_2=b_1;
b_1=b;
end
figure(1);
plot(time,y,'r',time,ym,'b');
xlabel('time(s)');ylabel('y and ym');
   
figure(2);
plot(time,y-ym,'r');
xlabel('time(s)');ylabel('identification error');

figure(3);
plot(time,dyu,'r');
xlabel('times');ylabel('dyu');