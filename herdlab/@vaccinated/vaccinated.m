classdef vaccinated
    properties
        age;
        pos;
        last_breed;
    end
    methods
        function vacc = vaccinated(varargin)
            vacc.age = varargin{1};
            vacc.pos = varargin{2};
            vacc.last_breed = varargin{3};
        end
    end
end
