function [x0, error, operaciones,tiempo] = lsqr(A,b,tol)
    operaciones = 0;
    n=length(A);
    x0=zeros(n,1);
    %(Resolver sistema Ax = b)
    beta=norm(b);
    u= b/beta;
    alpha = norm(A'*u);
    v=(A'*u)/alpha;
    errores = [];
    %Asignar w1=v1
    w=v;
    fi=beta;
    p=alpha;
    x1=x0;  
    operaciones = operaciones + 4*n;
    error = 1;
    tic;
    while error > tol
        x1=x0;
        %Bidiagonalización 
        beta=norm(A*v-alpha*u);
        %a)
        u=(A*v-alpha*u)/beta;
        %b)
        alpha=norm(A'*u-beta*v);
        v=(A'*u-beta*v)/alpha;
        %Construir y aplicar la siguiente transformación ortogonal
        pj=sqrt(p^2+beta^2);
        sj = beta/pj;
        cj = p/pj;
        o= sj*alpha;
        p=-cj*alpha;
        fi2=cj*fi;
        fi = sj*fi;
        x0= x0+(fi2/pj)*w;
        w= v-(o/pj)*w;
        error = norm(x0-x1);
        errores = [errores, error];   
        operaciones = operaciones + 30*n;
    end
    tiempo = toc;
    x0 = x0(:,1);
end