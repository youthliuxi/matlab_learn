clc
clear all
A=[1,-1,1,-3;0,-1,-1,1;2,-2,-4,6;1,-2,-4,1];
b=[1;0;-1;-1];
x=Pivot_Gauss(A,b)