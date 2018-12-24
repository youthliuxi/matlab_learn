function [sys,x0,str,ts] = phivector(t,x,input,flag,m,n,h)

% phi(t-1) = [u(t-1) ... u(t-m) -y(t-1) ... -y(t-n)]'
%
% Inputs: u, control signal; y, output
% Outputs: phi, regression vector;
% Parameters: m, n, number of parameters; h, sampling interval

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts] = mdlInitializeSizes(m,n,h);
     
  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,                                                
    sys = mdlUpdate(x,input,m,n);

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
function [sys,x0,str,ts] = mdlInitializeSizes(m,n,h)

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = n+m;
sizes.NumOutputs     = n+m;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);

x0 = zeros(m+n,1);
str = [];
ts  = [h 0]; 


% end mdlInitializeSizes
%
%=======================================================================
% mdlUpdate
% Update theta and P
%=======================================================================
%
function sys = mdlUpdate(x,input,m,n)

old_u = x(1:m);
old_y = x(m+1:m+n);
u = input(1);
y = input(2);


%change vector;
old_u = [u;old_u(1:m-1)];
old_y = [y;old_y(1:n-1)]; 

x = [old_u;old_y];

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


