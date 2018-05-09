classdef vulnerable
    
    properties
        age;
        health;
        pos;
        carrier;
        immune;
        last_breed;
    end
    
    methods
        function vuln = vulnerable(varargin)            
            vuln.age = varargin{1};
            vuln.health = varargin{2};
            vuln.pos = varargin{3};
            vuln.carrier = varargin{4};
            vuln.immune = varargin{5};
            vuln.last_breed = varargin{6};            
        end
    end
end
