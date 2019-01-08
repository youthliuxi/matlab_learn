% …œª˙Ã‚3.m
clear all
clc
x0=[0.2;0.6;1.0;1.4];
y0=[0.5535;1.0173;1.0389;0.8911];
x=0.5;
n=3;
Hfun= @ divided_linear;
Ivalue= feval(Hfun,x0,y0,x,n)