%Symbolic variables
syms u v
%Symbolic expression
phi1 = sym('(1+sqrt(5))/2')
phi2 = sym('(1-sqrt(5))/2')
phi1*phi2
simplify(phi1*phi2)
%Symbolic function
sym f(u,v)

%Symbolic matrices
syms a b c d
A = [a^2,b,c; d*b, c-a, sqrt(b)]
b = [a;b;c]
A*b