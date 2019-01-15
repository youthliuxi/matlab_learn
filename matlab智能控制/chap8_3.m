%CMAC Identification for nonlinear model
clear all;
close all;

xite=1.5;
alfa=0.05;

M=100;
N=7;
C=7;

w=zeros(N,1);
%w=rands(N,1);
w_1=w;
w_2=w;
d_w=w;

u_1=0;
y_1=0;
ts=0.001;

for k=1:1:500
time(k)=k*ts;

u(k)=sin(4*2*pi*k*ts);

xmin=-1.0; 
xmax=1.0;

s(k)=round((u(k)-xmin)*M/(xmax-xmin));    %Quantity

sum=0;
for i=1:1:C
   ad(i)=mod(s(k)+i,N)+1;   %Table mapping and Hash transfer:Start address
   sum=sum+w(ad(i));
end

ym(k)=sum;

%Nonlinear model
y(k)=u_1^3+y_1/(1+y_1^2);

error(k)=y(k)-ym(k);
d_w=xite*error(k)/C;

for i=1:1:C
   ad(i)=mod(s(k)+i,N)+1;
   w(ad(i))=w_1(ad(i))+ d_w+alfa*(w_1(ad(i))-w_2(ad(i)));
end

%%%% Parameters Update %%%%
w_2=w_1;
w_1=w;

u_1=u(k);
y_1=y(k);
end
figure(1);
plot(time,y,'b',time,ym,'r');
xlabel('time(s)');ylabel('y,ym');