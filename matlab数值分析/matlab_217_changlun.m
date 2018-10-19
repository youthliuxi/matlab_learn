%场论中的梯度、散度和旋度
%第一题
syms x y z
f=log(x^2+y^2+z^2);
grad_1=[diff(f,x),diff(f,y),diff(f,z)];
disp('u的梯度一般表达式');
grad_1=simplify(grad_1)
%把数字作为符号，计算出具体点的梯度
disp('u在点（1,2，-2）处的梯度为：')
grad_2=subs(grad_1,{x,y,z},{sym('1'),syms('2'),sym('-2')})

%第二题
syms x y z
P=x^2*y*z;
Q=x*y^2*z;
R=x*y*z^2;
%计算散度和旋度
div_1=diff(P,x)+diff(Q,y)+diff(R,z);
rot_1=[diff(R,y)-diff(Q,z),diff(P,z)-diff(R,x),diff(Q,x)-diff(P,y)];
%化简
disp('向量场A的散度：')
div_2=simplify(div_1)
disp('向量场A的旋度：')
rot_2=simplify(rot_1)