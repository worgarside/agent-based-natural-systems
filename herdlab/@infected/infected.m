classdef infected
    properties
        age;
        health;
        pos;
        infection_step;
        last_breed;
    end
    methods
        function f = infected(varargin)
            f.age = varargin{1};
            f.health = varargin{2};
            f.pos = varargin{3};
            f.infection_step = varargin{4};
            f.last_breed = varargin{4};
        end
    end
end