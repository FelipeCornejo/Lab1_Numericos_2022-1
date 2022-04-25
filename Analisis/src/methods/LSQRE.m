function [x0, error] = LSQRE(A,b,tol)
    iteraciones = 0;
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
    error = 1;
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
        iteraciones = iteraciones + 1;
        if iteraciones>100
            if var(errores(end-10:end)) == 0
                break;
            end 
        end
    end
    x0 = x0(:,1);
end