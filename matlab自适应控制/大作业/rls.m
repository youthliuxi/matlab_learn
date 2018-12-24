function [sys,x0,str,ts] = rls(t,x,u,flag,n,theta_0,P_0,lambda,h)

% y = phi'*theta
%
% Inputs: phi, regressor vector; y, output
% Outputs: theta, parameter vector; P, covariance matrix
% Parameters: n, number of parameters; theta_0, initial parameter estimates;
% P_0, initial covariance matrix; lambda, forgetting factor; 
% h, sampling interval

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts] = mdlInitializeSizes(n,theta_0,P_0,h);
     
  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,                                                
    sys = mdlUpdate(x,u,n,lambda);

  %%%%%%%%%%
  % Output %
  %%%%%%%%%%
  case 3,                                                
    sys = mdlOutputs(x);

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case {1,4,9},                                                
    sys = []; % do nothing

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['unhandled flag = ',num2str(flag)]);
end

%end rls

%
%=======================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=======================================================================
%
function [sys,x0,str,ts] = mdlInitializeSizes(n,theta_0,P_0,h)


sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = n+n^2;
sizes.NumOutputs     = n+n^2;
sizes.NumInputs      = n+1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);

x0 = mdlPack(theta_0,P_0,n);
str = [];
ts  = [h 0]; 


% end mdlInitializeSizes
%
%=======================================================================
% mdlUpdate
% Update theta and P
%=======================================================================
%
function sys = mdlUpdate(x,u,n,lambda)

% unpack theta,P, phi, and y
[theta,P] = mdlUnpack(x,n);
phi = u(1:n);
y = u(n+1);
% compute new estimate and update covariance matrix

K = P*phi/(lambda + phi'*P*phi);
new_theta = theta + K*(y - phi'*theta);
new_P = (eye(n) - K*phi')*P/lambda;
new_P = (new_P + new_P')/2;

% repack theta and P in x
x = mdlPack(new_theta,new_P,n);

sys = x;

%end mdlUpdate
%
%=======================================================================
% mdlOutputs
% Return theta and P
%=======================================================================
%
function sys = mdlOutputs(x)

sys = x;

%end mdlOutputs
%
%=======================================================================
% mdlPack
% Pack theta and P in x
%=======================================================================
%
function x = mdlPack(theta,P,n)

P_vec = [];
for j = 1:n
P_vec = [P_vec;P(:,j)];
end
x = [theta;P_vec];

%end mdlPack
%
%=======================================================================
% mdlUnpack
% Unpack theta and P from x
%=======================================================================
%
function [theta,P] = mdlUnpack(x,n)

theta = x(1:n,1);
P = [];
for j = 1:n
P = [P,x(j*n+1:(j+1)*n,1)];
end

%end mdlUnpack
