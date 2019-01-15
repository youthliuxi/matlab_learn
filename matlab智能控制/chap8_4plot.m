close all;

figure(1);
plot(t,y(:,1),'r',t,y(:,2),'b');
xlabel('time(s)');ylabel('speed tracking');

figure(2);
plot(t,y(:,1)-y(:,2),'r');
xlabel('time(s)');ylabel('speed tracking error');

u=out(:,1);
kp=out(:,2);
kf=out(:,3);

figure(3);
plot(t,u,'r');
xlabel('time(s)');ylabel('control input');

figure(4);
plot(t,kp,'r');
xlabel('time(s)');ylabel('kp');

figure(5);
plot(t,kf,'r');
xlabel('time(s)');ylabel('kf');