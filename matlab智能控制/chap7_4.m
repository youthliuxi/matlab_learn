%Diagonal Recurrent Neural Network
clear all;
close all;

wd=rands(7,1);
wo=rands(7,1);
wi=rands(3,7);
  
xj=zeros(7,1);
xj_1=xj;

u_1=0;y_1=0;

xitei=0.35; 
xited=0.35; 
xiteo=0.35;

ts=0.001;
for k=1:1:1000
time(k)=k*ts;
u(k)=0.5*sin(4*pi*k*ts);
y(k)=u_1^3+y_1/(1+y_1^2);

Ini=[u_1,y_1,1]';
for j=1:1:7
   sj(j)=Ini'*wi(:,j)+wd(j)*xj(j);
end
for j=1:1:7
   xj(j)=(1-exp(-sj(j)))/(1+exp(-sj(j)));
end

Pj=0*xj;
for j=1:1:7
   Pj(j)=wo(j)*(1+xj(j))*(1-xj(j))*xj_1(j);
end

Qij=0*wi;
for j=1:1:7
   for i=1:1:3
      Qij(i,j)=wo(j)*(1+xj(j))*(1-xj(j))*Ini(i);
   end
end   

ymk=0;
for j=1:1:7
   ymk=ymk+xj(j)*wo(j);
end
ym(k)=ymk;
e(k)=y(k)-ym(k);

wo=wo+xiteo*e(k)*xj;
wd=wd+xited*e(k)*Pj;
wi=wi+xitei*e(k)*Qij;
 
xj_1=xj;
u_1=u(k);
y_1=y(k);
end
figure(1);
plot(time,y,'r',time,ym,'b');
xlabel('time(s)');ylabel('Approaching');
figure(2);
plot(time,y-ym,'r');
xlabel('time(s)');ylabel('Approaching error');