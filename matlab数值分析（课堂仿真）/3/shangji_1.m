% �ϻ���1.m
clc
clear all
format long
A=[4 1 -1 1;1 4 -1 -1;-1 -1 5 1;1 -1 1 3];
b=[-2;-1;0;1];
x0=[0;0;0;0];esp=1e-5;N=300;
disp("Jacobi�������")
x=Jacobi(A,b,x0,eps,N);
disp("Gauss_Seidel�������")
x=Gauss_Seidel(A,b,x0,eps,N);