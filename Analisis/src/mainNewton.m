clear

%Se crea el sistema de ecuaciones a analizar.
% F %
syms x1 x2 x3
ec1 = x1^2 + x2 - 37;
ec2 = x1 - x2^2 - 5;
ec3 = x1 + x2 + x3 -3;
F = [ec1 ; ec2; ec3];

%Se inicializa el vector inicial
X1 = [1;1;1];

tol = 10e-10;

[convergencia,errorNormal,errorAbsoluto,errorRelativo,operaciones] = NewtonMulti(F,tol,X1);

figure;
plot(errorNormal);

figure;
plot(convergencia);