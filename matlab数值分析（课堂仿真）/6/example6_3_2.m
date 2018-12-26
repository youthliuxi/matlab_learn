% Example6_3_2.m
clc;
clear;
format long;
a=0;
b=1;
n=10;
syms x;
fun=4/(1+x^2);
Hfun=@ ComSimpsonR;% 获取函数句柄
Ivalue = feval(Hfun,fun,a,b,n)% 调用函数计算
%[str,maxsize] = computer