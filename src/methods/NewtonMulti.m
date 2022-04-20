function [convergencia,errorNormal,errorAbsoluto,errorRelativo,operaciones,iteraciones] = NewtonMulti(F, tolerancia,X1)
    %Se generan las variables que vamos a evaluar
    syms x1 x2 x3
    errorNormal = [];
    errorAbsoluto = [];
    errorRelativo = [];
    convergencia = [];
    operaciones = 0;
    evF = 1;
    iteraciones = 0;
    while (evF > tolerancia)
        Jac = jacobian(F); 
        %Evaluamos el Jacobiano
        evJ = subs(Jac,{x1;x2;x3},X1); 
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

        %Error normal
        error = evF;
        errorNormal = [errorNormal, error];

        %Error absoluto
        errorAbs = abs(evF - evFR);
        errorAbsoluto = [errorAbsoluto, errorAbs];

        %Error relativo
        errorRel = errorAbs/abs(evFR);
        errorRelativo = [errorRelativo, errorRel];
        iteraciones = iteraciones + 1;
    end
end