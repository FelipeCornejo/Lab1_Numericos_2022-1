function [veri] = positividad(A,n)

veri = true;
for i=1:n
    if A(i,i) == 0
        veri = false;
    end
end
end

