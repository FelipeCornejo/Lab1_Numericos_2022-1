function[k, x, error] = GaussJacobiE(A, b, n, iters)
    x=zeros(n,1);
    x0 = ones(n,1);
    k=0;
    error = 1;
    while k<iters && error ~= 0
        for i=1:n
         x(i)=(b(i)-A(i,[1:i-1,i+1:n])*x0([1:i-1,i+1:n]))/A(i,i);
        end
        error = norm(x-x0);
        x0=x;
        k=k+1;     
    end
 
end