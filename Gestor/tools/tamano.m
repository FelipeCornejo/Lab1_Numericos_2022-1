function [tamano] = tamano(n)
%Obtener el tamaño de la matriz con la cual comparar los datos.
tamano = 1089;
tamanos = [289,1089,4225];
for i=1:3
    aux = abs(tamanos(i)-n);
    if tamano > aux
        tamano = tamanos(i);
    end
end
end