function [sys,x0,str,ts] = zfilter(t,state,input,flag,n,m,h)
 
%  s0 + s1*z^-1 + ... + sm*z^-m
% ------------------------------
%  r0 + r1*z^-1 + ... + rn*z^-n
%
%
%
% Inputs: input = [s0 ... sm, r0 ... rn, u]'; numerator coefficients s0 ... sm,
% denominator coefficients r0 ... rn and input signal u to the block. 
%
% 
% Outputs: filtered signal y
%
% States: state = [old_u, old_y]'; 
% old input signals and old output values.
%
% Parameters: n; degree of numerator
%             m; degree of denominator
%             h; sampling interval


switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts] = mdlInitializeSizes(n,m,h);

  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,                                                
    sys = mdlUpdate(n,m,state,input); 

  %%%%%%%%%%
  % Output %
  %%%%%%%%%%
  case 3,                                                
    sys = mdlOutputs(n,m,state,input);

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case {1, 4, 9},                                                
    sys = []; % do nothing

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['unhandled flag = ',num2str(flag)]);
end

%end dsfunc

%
%=======================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=======================================================================
%
function [sys,x0,str,ts] = mdlInitializeSizes(n,m,h)


sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = n+m;
sizes.NumOutputs     = 1;
sizes.NumInputs      = n+1+m+1+1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);

x0  = zeros(n+m,1);
str = [];
ts  = [h 0]; 

% end mdlInitializeSizes
%
%=======================================================================
% mdlUpdate
% Handle discrete state updates, sample time hits, and major time step
% requirements.
%=======================================================================
%
function sys = mdlUpdate(n,m,state,input)


  
% unpack states and inputs


  old_u = 0; 
  if m ~= 0
    old_u = state(1:m);
   
  end;

  old_y = 0;
  if n ~= 0
    old_y = state(m+1:n+m);
  end;
 
  num = input(1:m+1)';
  den = input(m+2:n+m+2)';
  u = input(n+m+3);

 
% calculate output 
  
  if m ~= 0 & n ~= 0 
    y = (num*[u;old_u] - den(2:n+1)*old_y)/den(1);
  elseif m ~= 0
    y = (num*[u;old_u]);
  elseif n ~= 0
    y = (u - den(2:n+1)*old_y)/den(1);
  else
    y = u;
  end;

% pack states

  old_u = [u;old_u(1:m-1)];
  old_y = [y;old_y(1:n-1)];

  if n ~= 0 & m ~= 0
    state = [old_u ;old_y];
  elseif m ~= 0
    state = [old_u];
  elseif n ~= 0
    state = [old_y];
  end;

  sys = state;

%end mdlUpdate
%
%=======================================================================
% mdlOutputs
% Return Return the output vector for the S-function
%=======================================================================
%
function sys = mdlOutputs(n,m,state,input)
  
  % unpack states and inputs
 
   old_u = 0; 
  if m ~= 0
    old_u = state(1:m);
   
  end;

  old_y = 0;
  if n ~= 0
    old_y = state(m+1:n+m);
  end;
 
  num = input(1:m+1)';
  den = input(m+2:n+m+2)';
  u = input(n+m+3);

  % calculate output
 
  if m ~= 0 & n ~= 0 
    y = (num*[u;old_u] - den(2:n+1)*old_y)/den(1);
  elseif m ~= 0
    y = (num*[u;old_u]);
  elseif n ~= 0
    y = (u - den(2:n+1)*old_y)/den(1);
  else
    y = u;
  end;

  sys = y;

%end mdlOutputs










