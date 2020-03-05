function dx=odeankit(t,x)
R=4;
L=2;
C=2;
V=5;
dx(1) = x(2);
dx(2) =(V/L)-(R/L)*x(2)-(x(1)/C*L);
dx=[dx(1);dx(2)];



