function [convergencia,errorNormal,errorAbsoluto,errorRelativo,operaciones,iteraciones] = NewtonMulti(F, tolerancia,X1)
    %syms crea variables para evaluar en funciones
    syms x1 x2 x3
    errorNormal = [];
    errorAbsoluto = [];
    errorRelativo = [];
    convergencia = [];
    operaciones = 0;
    evF = 1;
    while (evF > tolerancia)
        Jac = jacobian(F); %Matriz jacobiana de F
        evJ = subs(Jac,{x1;x2;x3},X1); %Jacoviano evaluado
        evF = subs(F,{x1;x2;x3},X1);
        %H es la inversa del jacobiano 
        H = -inv(evJ)*evF;
        Xaux = X1+H;
        Xreal = X1;
        X1 = Xaux;
        
        %error absoluto de X1
        evF = double(subs(F, {x1;x2;x3}, X1));
        evF = sqrt(sum((evF).^2));
        %error absoluto de Xreal
        evFR = double(subs(F, {x1;x2;x3}, Xreal));
        evFR = sqrt(sum((evF).^2));

        raiz = double(Xreal');

        convergencia = [convergencia; raiz];

        %error normal
        error = evF;
        errorNormal = [errorNormal, error];

        %error absoluto
        errorAbs = abs(evF - evFR);
        errorAbsoluto = [errorAbsoluto, errorAbs];

        %error relativo
        errorRel = errorAbs/abs(evFR);
        errorRelativo = [errorRelativo, errorRel];
    end
end