%From robot2_rbfnn_sim.mdl
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
global node c b Fai
node=7;
c=0.1*[-1.5 -1 -0.5 0 0.5 1 1.5;
       -1.5 -1 -0.5 0 0.5 1 1.5;
       -1.5 -1 -0.5 0 0.5 1 1.5;
       -1.5 -1 -0.5 0 0.5 1 1.5;
       -1.5 -1 -0.5 0 0.5 1 1.5];
b=0.20;
Fai=5*eye(2);

sizes = simsizes;
sizes.NumContStates  = 2*node;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 11;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = zeros(1,2*node);
str = [];
ts  = [];
function sys=mdlDerivatives(t,x,u)
global node c b Fai
qd1=u(1);
d_qd1=u(2);
dd_qd1=u(3);
qd2=u(4);
d_qd2=u(5);
dd_qd2=u(6);

q1=u(7);
d_q1=u(8);
q2=u(9);
d_q2=u(10);
q=[q1;q2];

e1=qd1-q1;
e2=qd2-q2;
de1=d_qd1-d_q1;
de2=d_qd2-d_q2;
e=[e1;e2];
de=[de1;de2];
r=de+Fai*e;

qd=[qd1;qd2];
dqd=[d_qd1;d_qd2];
dqr=dqd+Fai*e;
ddqd=[dd_qd1;dd_qd2];
ddqr=ddqd+Fai*de;

z=[e;de;qd;dqd;ddqd];
for j=1:1:node
    h1(j)=exp(-norm(z(1)-c(:,j))^2/(b*b));
    h2(j)=exp(-norm(z(2)-c(:,j))^2/(b*b));
end

F=25*eye(2);
for i=1:1:node
    sys(i)=F(1,1)*h1(i)*r(1);
    sys(i+node)=F(2,2)*h2(i)*r(2);
end

function sys=mdlOutputs(t,x,u)
global node c b Fai
qd1=u(1);
d_qd1=u(2);
dd_qd1=u(3);
qd2=u(4);
d_qd2=u(5);
dd_qd2=u(6);

q1=u(7);
d_q1=u(8);
q2=u(9);
d_q2=u(10);
q=[q1;q2];

e1=qd1-q1;
e2=qd2-q2;
de1=d_qd1-d_q1;
de2=d_qd2-d_q2;
e=[e1;e2];
de=[de1;de2];
r=de+Fai*e;

W_f1=[x(1:node)]';
W_f2=[x(node+1:node*2)]';

qd=[qd1;qd2];
dqd=[d_qd1;d_qd2];
ddqd=[dd_qd1;dd_qd2];

z=[e;de;qd;dqd;ddqd];
for j=1:1:node
    h1(j)=exp(-norm(z(1)-c(:,j))^2/(b*b));
    h2(j)=exp(-norm(z(2)-c(:,j))^2/(b*b));
end
fn=[W_f1*h1';
    W_f2*h2'];
Kv=50*eye(2);

M=2;
if M==1
   tol=fn+Kv*r;    %Adaptive RBF Control
elseif M==2
   epN=0.20;
   bd=0.10;
   v=-(epN+bd)*sign(r);
   tol=fn+Kv*r-v;  %Robust adaptive RBF Control    
elseif M==3
   tol=Kv*r;       %PD Control
end

fn_norm=norm(fn);
sys(1)=tol(1);
sys(2)=tol(2);
sys(3)=fn_norm;