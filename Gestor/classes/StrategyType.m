classdef StrategyType
% Interface / Abstract Class 
% This class must be inherited. The child class must deliver the
% RunStrategy method that accept the TimeSeries class

   properties
   end

   methods (Abstract)
       RunStrategy(A,b,n,iter)
   end
   
   methods (Static)
       function rslt = newType(value)
          switch lower(value)
              case 1
                  rslt = GaussSeidel;
              case 2
                  rslt = LUDoolittle;
              case 3
                  rslt = Cholesky;              
              case 4
                  rslt = GramSchmidth;
              case 5
                  rslt = LSQR;
              case 6
                  rslt = LSQRD;
              %Si se añaden más métodos deberían de añadirse en esta
              %sección hacia abajo, recordando que el número indicado
              %debería calzar con la columna de los datos en la matriz
              %implement.
              otherwise
                  error('El tipo tiene que ser un número válido');
          end
       end
   end
end 

%EOF