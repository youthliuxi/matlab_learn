%Local linearization for single inverted pendulum
clear all;
close all;

g=9.8;
m=2;
M=8;
l=0.5;
a=l/(m+M);

%Equation:
A21=g/(4/3*l-a*m*l);
A=[0 1;
   A21 0];
B2=-a/(4/3*l-a*m*l);
B=[0;B2];