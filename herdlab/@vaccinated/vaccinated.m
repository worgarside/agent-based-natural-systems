classdef vaccinated
    properties
        age;
        health;
        pos;
        last_breed;
    end
    methods
        function vacc = vaccinated(varargin)
            vacc.age = varargin{1};
            vacc.health = varargin{2};
            vacc.pos = varargin{3};
            vacc.last_breed = varargin{4};
        end
    end
end
