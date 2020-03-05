clc;
tic
clear
lb=zeros(1,3);
A=[-0.1 -0.2 -0.4;-0.45 -0.25 -0.3];
b=[-30;-40]';
Z=[15 10 20];
y=linprog(Z,A,b,[],[],lb)
toc