%隐函数的偏导数
syms x y z
%第一题 隐函数偏导数问题
F=x*y*z^3+x^2+y^3-z;
pz_x=-diff(F,x)/diff(F,z);
pz_y=-diff(F,y)/diff(F,z);
%第二题 隐函数组偏导数问题
syms x y u v
F=x*u-y*v;
H=y*u+x*v-1;
G=[F,H];
jaco=jacobian(G,[u,v])%雅克比矩阵
jaco=det(jaco);
pu_x=-det(jacobian(G,[x,v]))/jaco;
pu_y=-det(jacobian(G,[y,v]))/jaco;
pv_x=-det(jacobian(G,[x,u]))/jaco;
pv_y=-det(jacobian(G,[y,u]))/jaco;