%Pi-Sigma Type Fuzzy Neural Network
clear all;
close all;

xite=0.85;
alfa=0.05;

p0=0.1*ones(9,1);
p1=0.1*ones(9,1);
p2=0.1*ones(9,1);

p0_1=p0;p0_2=p0_1;
p1_1=p1;p1_2=p1_1;
p2_1=p2;p2_2=p2_1;

c0=[-5,0,5];
b0=[3,3,3];
for i=1:1:3
for j=1:1:3
m=3*(i-1)+j;
c(m,1)=c0(i);
c(m,2)=c0(j);

b(m,1)=b0(i);
b(m,2)=b0(j);
end
end

c_1=c;
c_2=c_1;
b_1=b;
b_2=b_1;

yd_1=0;
u_1=0;

ts=0.001;
for k=1:1:1000
time(k)=k*ts;
   
u(k)=0.50*sin(6*pi*k*ts);
yd(k)=u_1^3+yd_1/(1+yd_1^2);

x(1)=u(k);
x(2)=yd_1;

for i=1:1:2
for j=1:1:9
    fz(i,j)=exp(-(x(i)-c(j,i))^2/b(j,i));
end
end

for i=1:1:9
 	 w(i)=fz(1,i)*fz(2,i);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addw=0;
for i=1:1:9
    addw=addw+w(i);
end

for i=1:1:9
    yi(i)=p0_1(i)+p1_1(i)*x(1)+p2_1(i)*x(2);
end

addyw=0;
for i=1:1:9
    addyw=addyw+yi(i)*w(i);
end

yn(k)=addyw/addw;
e(k)=yd(k)-yn(k);

%Learning
d_p=0*p0;
for i=1:1:9
    d_p(i)=xite*e(k)*w(i)/addw;
end
   p0=p0_1+ d_p+alfa*(p0_1-p0_2);
   p1=p1_1+ d_p*x(1)+alfa*(p1_1-p1_2);
   p2=p2_1+ d_p*x(2)+alfa*(p2_1-p2_2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d_b=0*b_1;
for i=1:1:9
for j=1:1:2
   d_b(i,j)=xite*e(k)*(yi(i)*addw-addyw)*(x(j)-c(i,j))^2*w(i)/(b(i,j)^2*addw^2);
end
end
   b=b_1+d_b+alfa*(b_1-b_2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
d_c=0*c_1;
for i=1:1:9
for j=1:1:2
   d_c(i,j)=xite*e(k)*(yi(i)*addw-addyw)*2*(x(j)-c(i,j))*w(i)/(b(i,j)*addw^2);
end
end
c=c_1+d_c+alfa*(c_1-c_2);
   
p0_2=p0_1;p0_1=p0;
p1_2=p1_1;p1_1=p1;
p2_2=p2_1;p2_1=p2;

c_2=c_1;c_1=c;   
b_2=b_1;b_1=b;
 
u_1=u(k);
yd_1=yd(k);
end   
figure(1);
plot(time,yd,'r',time,yn,'b');
xlabel('time(s)');ylabel('Approaching');

figure(2);
plot(time,yd-yn,'r');
xlabel('time(s)');ylabel('Approaching error');