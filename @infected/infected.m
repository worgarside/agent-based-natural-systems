classdef infected
    properties
        age;
        pos;
        infection_step;
        last_breed;
    end
    methods
        function f = infected(varargin)
            f.age = varargin{1};
            f.pos = varargin{2};
            f.infection_step = varargin{3};
            f.last_breed = varargin{4};
        end
    end
end