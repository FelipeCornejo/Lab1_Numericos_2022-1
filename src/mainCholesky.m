A1089 = load('./data/A1089.dat');
b1089 = load('./data/b1089.dat');

%disp(A1089)

L = cholesky(A1089);

errorChol = norm(L*L' - A1089);

%Aplicamos progresivo
Lp = progresivo(L, b1089);

%Aplicamos regresivo
x = regresivo(L', Lp);
%Sacamos el error
norm(A1089*x - b1089)

%Calculamos el numero de instrucciones

%disp(x)


