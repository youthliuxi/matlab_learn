% Example6_4_2.m
clc;
clear;
format long;
a=0;
b=1;
epsilon=10^(-14);
syms x;
fun=4/(1+x^2);
Hfun=@ Romberg;%��ȡ�������
Ivalue=feval(Hfun,fun,a,b,epsilon)%���ú�������