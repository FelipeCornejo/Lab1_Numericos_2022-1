function [solucion,error] = GramSchmidthE(A,b)

[~,n] = size(A);

Q = A;
R = zeros(n);
for (k=1:n)
    for (i=1:k-1)
        R(i,k) = Q(:,i)' * Q(:,k);
        Q(:,k) = Q(:,k) - Q(:,i) * R(i,k);
    end
    R(k,k) = norm(Q(:,k));
    Q(:,k) = Q(:,k)/R(k,k);
end

y = Q'*b;
solucion = regresivo(R,y);
%Sacamos el error
error = norm(A*solucion - b);

end

