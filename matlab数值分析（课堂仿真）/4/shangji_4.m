% 上机题4.m
clc
clear
X=0:0.1:2
xi=[0.2 0.6 1.0 1.4];
yi=[0.5535 1.0173 1.0389 0.8911];
a=0.5;  
  
% interp1对sin函数进行分段线性插值，调用interp1的时候，默认的是分段线性插值    
y1 = interp1(xi,yi,X,'linear');
plot(xi,yi,'o',X,y1,'r')    
title('分段线性插值')    