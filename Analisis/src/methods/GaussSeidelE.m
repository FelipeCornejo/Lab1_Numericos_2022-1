function [x,error] = GaussSeidelE(A,b,n,iters)
    error = 1;
    k = 0;
    x = zeros(n, 1);
    while k<iters && error ~= 0
        x_old=x;
        for i=1:n
            sigma=0;
            for j=1:i-1
                    sigma=sigma+A(i,j)*x(j);
            end
            for j=i+1:n
                    sigma=sigma+A(i,j)*x_old(j);
            end
            x(i)=(1/A(i,i))*(b(i)-sigma);
        end
        k=k+1;
        error=norm(x_old-x);
    end

end

