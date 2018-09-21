syms a1 a2 a3 a4 a5 a6;
syms a b c d e f g h i;
A = [0 0 a1;0 a2 a3;a4 a5 a6];
B = [a b c;d e f;g h i];
C = A*B;
D = B*A;
E = C - D;
