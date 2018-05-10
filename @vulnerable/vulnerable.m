classdef vulnerable    
    properties
        age;
        pos;
        last_breed;
    end    
    methods
        function vuln = vulnerable(varargin)            
            vuln.age = varargin{1};
            vuln.pos = varargin{2};
            vuln.last_breed = varargin{3};            
        end
    end
end
