A1089 = load('./data/A1089.dat');
b1089 = load('./data/b1089.dat');

[x0, error, operaciones,tiempo] = lsqr(A1089, b1089, 1e-10);
plot = [tiempo, error];
