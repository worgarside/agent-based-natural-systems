classdef susceptible   
    % An agent who is susceptible to infection. They create susceptible
    % offspring
    
    properties
        age;
        pos;
        last_breed;
    end    
    methods
        function susc = susceptible(varargin)            
            susc.age = varargin{1};
            susc.pos = varargin{2};
            susc.last_breed = varargin{3};            
        end
    end
end
