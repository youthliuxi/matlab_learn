%Fuzzy Controller Design
clear all;
close all;

a=newfis('fuzzf');

f1=1;
a=addvar(a,'input','e',[-3*f1,3*f1]);            %Parameter e
a=addmf(a,'input',1,'NB','zmf',[-3*f1,-1*f1]);
a=addmf(a,'input',1,'NM','trimf',[-3*f1,-2*f1,0]);
a=addmf(a,'input',1,'NS','trimf',[-3*f1,-1*f1,1*f1]);
a=addmf(a,'input',1,'Z','trimf',[-2*f1,0,2*f1]);
a=addmf(a,'input',1,'PS','trimf',[-1*f1,1*f1,3*f1]);
a=addmf(a,'input',1,'PM','trimf',[0,2*f1,3*f1]);
a=addmf(a,'input',1,'PB','smf',[1*f1,3*f1]);

f2=1;
a=addvar(a,'input','ec',[-3*f2,3*f2]);          %Parameter ec
a=addmf(a,'input',2,'NB','zmf',[-3*f2,-1*f2]);
a=addmf(a,'input',2,'NM','trimf',[-3*f2,-2*f2,0]);
a=addmf(a,'input',2,'NS','trimf',[-3*f2,-1*f2,1*f2]);
a=addmf(a,'input',2,'Z','trimf',[-2*f2,0,2*f2]);
a=addmf(a,'input',2,'PS','trimf',[-1*f2,1*f2,3*f2]);
a=addmf(a,'input',2,'PM','trimf',[0,2*f2,3*f2]);
a=addmf(a,'input',2,'PB','smf',[1*f2,3*f2]);

f3=1.5;
a=addvar(a,'output','u',[-3*f3,3*f3]);          %Parameter u
a=addmf(a,'output',1,'NB','zmf',[-3*f3,-1*f3]);
a=addmf(a,'output',1,'NM','trimf',[-3*f3,-2*f3,0]);
a=addmf(a,'output',1,'NS','trimf',[-3*f3,-1*f3,1*f3]);
a=addmf(a,'output',1,'Z','trimf',[-2*f3,0,2*f3]);
a=addmf(a,'output',1,'PS','trimf',[-1*f3,1*f3,3*f3]);
a=addmf(a,'output',1,'PM','trimf',[0,2*f3,3*f3]);
a=addmf(a,'output',1,'PB','smf',[1*f3,3*f3]);

rulelist=[1 1 1 1 1;         %Edit rule base
          1 2 1 1 1;
          1 3 2 1 1;
          1 4 2 1 1;
          1 5 3 1 1;
          1 6 3 1 1;
          1 7 4 1 1;
   
          2 1 1 1 1;
          2 2 2 1 1;
          2 3 2 1 1;
          2 4 3 1 1;
          2 5 3 1 1;
          2 6 4 1 1;
          2 7 5 1 1;
          
          3 1 2 1 1;
          3 2 2 1 1;
          3 3 3 1 1;
          3 4 3 1 1;
          3 5 4 1 1;
          3 6 5 1 1;
          3 7 5 1 1;
          
          4 1 2 1 1;
          4 2 3 1 1;
          4 3 3 1 1;
          4 4 4 1 1;
          4 5 5 1 1;
          4 6 5 1 1;
          4 7 6 1 1;
          
          5 1 3 1 1;
          5 2 3 1 1;
          5 3 4 1 1;
          5 4 5 1 1;
          5 5 5 1 1;
          5 6 6 1 1;
          5 7 6 1 1;
          
          6 1 3 1 1;
          6 2 4 1 1;
          6 3 5 1 1;
          6 4 5 1 1;
          6 5 6 1 1;
          6 6 6 1 1;
          6 7 7 1 1;
       
          7 1 4 1 1;
          7 2 5 1 1;
          7 3 5 1 1;
          7 4 6 1 1;
          7 5 6 1 1;
          7 6 7 1 1;
          7 7 7 1 1];
          
a=addrule(a,rulelist);
%showrule(a)                        % Show fuzzy rule base

a1=setfis(a,'DefuzzMethod','mom');  % Defuzzy
writefis(a1,'fuzzf');               % save to fuzzy file "fuzz.fis" which can be
                                    % simulated with fuzzy tool
a2=readfis('fuzzf');
disp('-------------------------------------------------------');
disp('     fuzzy controller table:e=[-3,+3],ec=[-3,+3]       ');
disp('-------------------------------------------------------');

Ulist=zeros(7,7);

for i=1:7
   for j=1:7
      e(i)=-4+i;
      ec(j)=-4+j;
      Ulist(i,j)=evalfis([e(i),ec(j)],a2);
   end
end

Ulist=ceil(Ulist)

figure(1);
plotfis(a2);
figure(2);
plotmf(a,'input',1);
figure(3);
plotmf(a,'input',2);
figure(4);
plotmf(a,'output',1);