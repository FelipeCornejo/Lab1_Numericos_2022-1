classdef TimeSeries
    %TIMESERIES Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Name = '';
        % More properties will go here incl possibly a data matrix
    end
    
    methods
        function obj = TimeSeries(inName)
            obj.Name = inName;
        end
        
        % More methods go in here specific to data
    end
    
end

%EOF