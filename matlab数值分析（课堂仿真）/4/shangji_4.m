% �ϻ���4.m
clc
clear
X=0:0.1:2
xi=[0.2 0.6 1.0 1.4];
yi=[0.5535 1.0173 1.0389 0.8911];
a=0.5;  
  
% interp1��sin�������зֶ����Բ�ֵ������interp1��ʱ��Ĭ�ϵ��Ƿֶ����Բ�ֵ    
y1 = interp1(xi,yi,X,'linear');
plot(xi,yi,'o',X,y1,'r')    
title('�ֶ����Բ�ֵ')    