function [sys,x0,str,ts] = spacemodel(t,x,u,flag)

switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [0;0];
str = [];
ts = [];

function sys=mdlDerivatives(t,x,u)
F=x(1);
G=x(2);

nd=u(1);
n=u(2);

nmn1=5;
nmn2=5;

S1=50;
S2=50;

K=10;

w11=-K^2*n^2;
w12=K^2*n*nd;
w21=w12;
w22=-K^2*nd^2;

I1=-K*nd*n;
I2=K*nd^2;

du1=w11*F+w12*G+I1;
du2=w21*F+w22*G+I2;

sys(1)=nmn1/(2*S1)*(S1^2-F^2)*du1;
sys(2)=nmn2/(2*S2)*(S2^2-G^2)*du2;
function sys=mdlOutputs(t,x,u)

F=x(1);
G=x(2);

nd=u(1);
n=u(2);
ut=-F*n+G*nd;

kp=F;
kf=G-kp;

sys(1)=ut;
sys(2)=kp;
sys(3)=kf;