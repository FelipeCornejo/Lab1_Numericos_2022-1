clear
clc
%---------------------
%---Carga de Datos----
%---------------------
%Carga de Matriz de información.
%Definirá los rangos para las decisiones de método a escoger.
%Por el momento será una carga estática
%Debería cambiarse a un seleccionador GUI!
A = load("A1089.dat");
b = load('A1089.dat');

%PARA ESTE GESTOR SE ANALIZARON LOS DISTINTOS METODOS SOBRE DISTINTOS
%TAMAÑOS DE MATRICES, HUBO UN METODO (GAUSS.JACOBI) EL CUAL SE ELIMINÓ DEBIDO A QUE SUS
%DATOS AFECTABAN EL PESO DE LOS OTROS MÉTODOS.

%------------------------------
%---Definición de parametros---
%------------------------------
%Definición de Tolerancia para aceptación de los métodos estudiados.
%Al definirlo como variable global implicará que todos los métodos
%tienen el mismo estandar de parada.
tol = 0.0000000001; % e-10

%Tamaño de la matríz
[n,m] = size(A);

%Ingreso de eficacia por consola.
efica = input("Ingrese la eficacia para la resolución del problema sistema con un valor entre 0 y 1: ");
if (efica > 1) %Por si el usuario ingresa algo mayor a 1
    efica = 1;
end
%Ingreso de eficiencia por consola.
efici = input("Ingrese la eficiencia para la resolución del problema sistema con un valor entre 0 y 1: ");
if (efici > 1) %Por si el usuario ingresa algo mayor a 1
    efici = 1;
end
error = 1 - efica;
tiempo = 1 - efici;
%Las lineas anteriores es solo por tema de lenguaje entre usuario y los
%parametros.
%Es decir, si se requiere una EFICIENCIA ALTA, entonces debería realizar el
%programa en un TIEMPO BAJO. Lo mismo para la efiacia y el error.

%Se obtienen las propiedades importantes de condiciones de la matriz para saber que tipo
%de métodos se podrían realizar.
%DIMENSIONES
cuadradro = false;
if n == m
    cuadradro = true;
end

%DISPERCIÓN
disper = dispercion(A,n);

%POSITIVIDAD
posi = positividad(A,n);

%Desicioes para escoger el método a resolver
tic
%DECIDIR TAMAÑO CON CUAL COMPARAR
tam = tamano(m);

%CARGA DE DATOS RESPECTO AL TAMAÑO DE LA MATRIZ
if tam == 289
    implement = load('data\implements.mat').implement289;
    iter = 400;
elseif tam == 1089
    implement = load('data\implements.mat').implement1089;
    iter = 1500;
elseif tam == 4225
    implement = load('data\implements.mat').implement4225;
    oter = 4000;
end

%AQUI DEBERIA DE ELIMINAR LAS COLUMNAS (METODOS) QUE NO PUEDAN REALIZAR LA
%MATRIZ DEBIDO A LAS PROPIEDADES DE ARRIBA
%-----------------------------------------%
%-----------------------------------------%

%OBTENER LA DISTANCIA Y CUAL MÉTODO OCUPAR
%DECIDE EN BASE A LA MENOR DISTANCIA ENTRE EL PUNTO DE (ERROR,TIEMPO)
%RESPECTO A LOS RESULTADOS DE LA MATRIZ
[dista, coll] = distancia(error,tiempo,implement);

tic
s = Strategy(coll);
[solucion, tiempoSol] = s.RunStrategy(A,b,n,iter,tol);
tooc = toc;
difTime = tooc - tiempoSol;
%como tooc mide el tiempo del gestor + el tiempo de solución, lo que se
%procedió a hacer fue que se resta el tiempo de solución al total tooc para
%así obtener el tiempo del gestor.

%Si difTime es menor al tiempo de solución, significa en ese caso que el
%gestor se demora menos en ejecutar que la solución.

%En caso contrario, no es optimo usar un gestor en terminos de tiempo, ya
%que agregaría un tiempo mayor a lo que debería solucionar.
