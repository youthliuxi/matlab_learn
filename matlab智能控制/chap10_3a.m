%GA(Generic Algorithm) to Optimize Initial Parameters of RBF Approaching
clear all;
close all;

G=150;
Size=30;
CodeL=10;

for i=1:1:3
	MinX(i)=0.1*ones(1);
	MaxX(i)=3*ones(1);
end
for i=4:1:9
	MinX(i)=-3*ones(1);
	MaxX(i)=3*ones(1);
end
for i=10:1:12
	MinX(i)=-ones(1);
	MaxX(i)=ones(1);
end

E=round(rand(Size,12*CodeL));    %Initial Code!

BsJ=0;

for kg=1:1:G
time(kg)=kg;
    
for s=1:1:Size
m=E(s,:);

for j=1:1:12
y(j)=0;

mj=m((j-1)*CodeL+1:1:j*CodeL);
	for i=1:1:CodeL
   	y(j)=y(j)+mj(i)*2^(i-1);
	end
		f(s,j)=(MaxX(j)-MinX(j))*y(j)/1023+MinX(j);
end

%****** Step 1 : Evaluate BestJ ******
p=f(s,:);
    
[p,BsJ]=chap10_3b(p,BsJ);

BsJi(s)=BsJ;   
end
 
[OderJi,IndexJi]=sort(BsJi);
BestJ(kg)=OderJi(1);
BJ=BestJ(kg);
Ji=BsJi+1e-10;

fi=1./Ji;
[Oderfi,Indexfi]=sort(fi);          %Arranging fi small to bigger
Bestfi=Oderfi(Size);           % Let Bestfi=max(fi)
BestS=E(Indexfi(Size),:);      % Let BestS=E(m), m is the Indexfi belong to max(fi)

kg   
p
BJ
%****** Step 2 : Select and Reproduct Operation******
   fi_sum=sum(fi);
   fi_Size=(Oderfi/fi_sum)*Size;
   
   fi_S=floor(fi_Size);        %Selecting Bigger fi value
   
   kk=1;
   for i=1:1:Size
      for j=1:1:fi_S(i)        %Select and Reproduce 
       TempE(kk,:)=E(Indexfi(i),:);  
         kk=kk+1;              %kk is used to reproduce
      end
   end
   
%************ Step 3 : Crossover Operation ************
pc=0.60;
n=ceil(20*rand);
for i=1:2:(Size-1)
    temp=rand;
    if pc>temp                 %Crossover Condition
    for j=n:1:20
        TempE(i,j)=E(i+1,j);
        TempE(i+1,j)=E(i,j);
    end
    end
end
TempE(Size,:)=BestS;
E=TempE;
   
%************ Step 4: Mutation Operation **************
pm=0.001-[1:1:Size]*(0.001)/Size; %Bigger fi, smaller pm
   for i=1:1:Size
      for j=1:1:12*CodeL
         temp=rand;
         if pm>temp               %Mutation Condition
            if TempE(i,j)==0
               TempE(i,j)=1;
            else
               TempE(i,j)=0;
            end
        end
      end
   end
%Guarantee TempE(Size,:) belong to the best individual
TempE(Size,:)=BestS;
E=TempE;
%*******************************************************
 end
 
 Bestfi
 BestS
 fi
 Best_J=BestJ(G)
 figure(1);
 plot(time,BestJ);
 xlabel('Times');ylabel('Best J');
 save pfile p;