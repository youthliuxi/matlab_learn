%Preidctive control based on RBF Identification
clear all;
close all;

xite=0.30;
alfa=0.04;
x=[0,0,0]';

c=[ -3 -2 -1 1 2 3;
    -3 -2 -1 1 2 3;
    -3 -2 -1 1 2 3];
b=20*ones(6,1);

%w=rands(6,1)
w =[0.0310
   -0.3321
   -0.1342
   -0.5481
    0.1596
    0.5207];
h=[0,0,0,0,0,0]';
    
c_1=c;
c_2=c_1;

b_1=b;
b_2=b_1;

w_1=w;
w_2=w_1;

u=0;u_1=0;u_2=0;u_3=0;
y_1=0;y_2=0;y_3=0;
dy_1=0;dy_2=0;dy_3=0;

xiteu=0.3;

ts=0.001;
for k=1:1:2000
   time(k)=k*ts;
   r(k)=0.5*sign(sin(1*2*pi*k*ts));
   
   y(k)=y_1-y_2+y_3+u_1+u_2+u_3;

   x(1)=u_1;
   x(2)=y_1;
   x(3)=y_2;
   for j=1:1:6
      h(j)=exp(-norm(x-c(:,j))^2/(2*b(j)*b(j)));
   end
   ym(k)=w'*h;         

   d_w=0*w;
   for j=1:1:6
      d_w(j)=xite*(y(k)-ym(k))*h(j);
   end
   w=w_1+d_w+alfa*(w_1-w_2);
   
   d_b=0*b;
   for j=1:1:6
      d_b(j)=xite*(y(k)-ym(k))*w_1(j)*h(j)*(b(j)^-3)*norm(x-c(:,j))^2;
   end
   b=b_1+ d_b+alfa*(b_1-b_2);
   
   for j=1:1:6
     for i=1:1:3
      d_c(i,j)=xite*(y(k)-ym(k))*w_1(j)*h(j)*(x(i)-c(i,j))*(b(j)^-2);
     end
   end
   c=c_1+d_c+alfa*(c_1-c_2);
 
  %%%%%%%%%%%%%%%%%%%%%%%%%Jacobian%%%%%%%%%%%%%%%%%%%%%%%%%
  yu=0;
  for  j=1:1:6
      yu=yu+w(j)*h(j)*(-x(1)+c(1,j))/b(j)^2; 
   end
  dy(k)=yu;
  
  dJu(k)=2*0.5*u_1+2*0.5*(y(k)-r(k))*dy(k)+2*0.5*(y_1-r(k))*dy_1+2*0.5*(y_2-r(k))*dy_2+2*0.5*(y_3-r(k))*dy_3;
       
  u(k)=u_1-xiteu*dJu(k);
  
   u_3=u_2;
   u_2=u_1;
   u_1=u(k);
   
   y_3=y_2;
   y_2=y_1;
   y_1=y(k);
   
   w_2=w_1;
   w_1=w;
   
   c_2=c_1;
   c_1=c;
   
   b_2=b_1;
   b_1=b;
   
   dy_3=dy_2;
   dy_2=dy_1;
   dy_1=dy(k);
end
figure(1);
plot(time,r,'r',time,y,'b');
xlabel('time(s)');ylabel('Position tracking');
%figure(2);
%plot(time,dy,'r');
%xlabel('time(s)');ylabel('Jacobian');