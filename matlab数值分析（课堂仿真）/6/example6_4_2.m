% Example6_4_2.m
clc;
clear;
format long;
a=0;
b=1;
epsilon=10^(-14);
syms x;
fun=4/(1+x^2);
Hfun=@ Romberg;%获取函数句柄
Ivalue=feval(Hfun,fun,a,b,epsilon)%调用函数计算