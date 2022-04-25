classdef LUDoolittle < StrategyType
%DONCHIAN Summary of this class goes here
%   Detailed explanation goes here
% This class has a contract with the StrategyType Interface. It must
% deliver a RunStrategy method that takes in a TimeSeries class

   properties
   end

   methods
       function [solucion,tiempo] = RunStrategy(obj, A,b,n,iter,tol)
          [solucion, tiempo] = LUDoolittleM(A,b);
          disp("LUDoolittle");           
       end
   end
end 

%EOF