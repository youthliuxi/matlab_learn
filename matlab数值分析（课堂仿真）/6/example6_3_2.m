% Example6_3_2.m
clc;
clear;
format long;
a=0;
b=1;
n=10;
syms x;
fun=4/(1+x^2);
Hfun=@ ComSimpsonR;% ��ȡ�������
Ivalue = feval(Hfun,fun,a,b,n)% ���ú�������
%[str,maxsize] = computer