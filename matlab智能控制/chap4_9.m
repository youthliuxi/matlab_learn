%Sugeno type fuzzy control for single inverted pendulum
close all;
warning off;

P=[-10-10i;-10+10i];     %Stable pole point
F=place(A,B,P)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tsu=newfis('tsu','sugeno');
tsu=addvar(tsu,'input','x',[-15,15]*pi/180);
tsu=addmf(tsu,'input',1,'ZR','trimf',[-15,0,15]*pi/180);

tsu=addvar(tsu,'input','dx',[-200,200]*pi/180);
tsu=addmf(tsu,'input',2,'ZR','trimf',[-200,0,200]*pi/180);

tsu=addvar(tsu,'output','u',[-200,600]);
tsu=addmf(tsu,'output',1,'No.1','linear',[-F(1),-F(2) 0]);

rulelist1=[1 1 1 1 1];
tsu=addrule(tsu,rulelist1);
writefis(tsu,'out');
out1 = readfis('out');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
model=newfis('model','sugeno');
model=addvar(model,'input','x',[-15,15]*pi/180);
model=addmf(model,'input',1,'ZR','trimf',[-15,0,15]*pi/180);

model=addvar(model,'input','dx',[-200,200]*pi/180);
model=addmf(model,'input',2,'ZR','trimf',[-200,0,200]*pi/180);

model=addvar(model,'input','u',[-200,600]);

model=addvar(model,'output','dx',[-200,200]*pi/180);
model=addmf(model,'output',1,'No.1','linear',[0 1 0 0]);

model=addvar(model,'output','ddx',[-200,200]*pi/180);
model=addmf(model,'output',2,'No.1','linear',[A(2,1),A(2,2),B(2) 0]);

rulelist2=[1 1 0 1 1 1 1];
model=addrule(model,rulelist2);
writefis(model,'out');
out2 = readfis('out');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ts=0.02;
x=[0.2,0];  %Initial state
for k=1:1:100
   time(k)=k*ts;
  
   u(k)=evalfis([x(1),x(2)],out1);       %Using fuzzy T-S model "tsu.fis" 
   dx=evalfis([x(1),x(2),u(k)],out2);    %Using fuzzy T-S model "model.fis"
   x=x+ts*dx;
   
   y1(k)=x(1);
   y2(k)=x(2);
end
figure(1);
subplot(211);
plot(time,y1);
xlabel('time(s)'),ylabel('Angle');
subplot(212);
plot(time,y2);
xlabel('time(s)'),ylabel('Angle rate');

figure(2);
plot(time,u);
xlabel('time(s)'),ylabel('Control input');

figure(3);
plotmf(tsu,'input',1);
figure(4);
plotmf(tsu,'input',2);

showrule(tsu);
showrule(model);