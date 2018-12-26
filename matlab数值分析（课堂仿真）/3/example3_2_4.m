% Example3_2_4.m
clc
clear all
format long
A=[10,-1,2,0;-1,11,-1,3;2,-1,10,-1;0,3,-1,8];
b=[6;25;-11;15];
x0=[0;0;0;0];esp=1e-3;N=300;
x=Gauss_Seidel(A,b,x0,eps,N);