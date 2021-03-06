clc
clear all
A=[4 2 -3 1 2 1 0 0 0 0;
    8 6 -5 -3 6 5 0 1 0 0;
    4 2 -2 -1 3 2 -1 0 3 1;
    0 -2 1 5 -1 3 -1 1 9 4;
    -4 2 6 -1 6 7 -3 3 2 3;
    8 6 -8 5 7 17 2 6 -3 5;
    0 2 -1 3 -4 2 5 3 0 1;
    16 10 -11 -9 17 34 2 -1 2 2;
    4 6 2 -7 13 9 2 0 12 4;
    0 0 -1 8 -3 -24 -8 6 3 -1];
b=[5;12;3;2;3;46;23;26;19;-21];
%disp('使用Gauss列主元消去法：')
tic
x=Pivot_Gauss(A,b)
t=toc
%disp('使用按列选主元的Doolittle方法：')
tic
x=Doolittle(A,b)
t=toc
%disp('使用普通的Doolittle方法：')
tic
x=Doolittle_2(A,b)
t=toc
%y=A\b