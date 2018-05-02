classdef vaccinated
    properties
        age;
        health;
        pos;
    end
    methods
        function vacc = vaccinated(varargin)            
            switch nargin
                case 0
                    vacc.age = [];
                    vacc.health = [];                  
                    vacc.pos = [];                    
                case 1
                    if (isa(varargin{1},'vaccinated'))
                        vacc = varargin{1};
                    else
                        error('Input argument is not vaccinated')
                    end
                case 3
                    vacc.age = varargin{1};
                    vacc.health = varargin{2};
                    vacc.pos = varargin{3};
                    
                otherwise
                    error('Invalid no. of input arguments')
            end
        end
    end
end
