classdef vaccinated   %declares vaccinated object
    properties    %define vaccinated properties (parameters)
        age;
        food;
        pos;
        speed;
        last_breed;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
        %all additional member functions associated with this class are included as separate mfiles in the @vaccinated folder.
        function r=vaccinated(varargin) %constructor method for vaccinated - assigns values to vaccinated properties
            %r=vaccinated(age,food,pos....)
            %
            %age of agent (usually 0)
            %food - amount of food that vaccinated has eaten
            %pos - vector containg x,y, co-ords
            
            switch nargin           %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0				%create default object
                    r.age=[];
                    r.food=[];
                    r.pos=[];
                    r.speed=[];
                    r.last_breed=[];
                case 1              %input is already a vaccinated, so just return!
                    if (isa(varargin{1},'vaccinated'))
                        r=varargin{1};
                    else
                        error('Input argument is not vaccinated')
                        
                    end
                case 5               %create a new vaccinated (currently the only constructor method used)
                    r.age=varargin{1};               %age of vaccinated object in number of iterations
                    r.food=varargin{2};              %current food content (arbitrary units)
                    r.pos=varargin{3};               %current position in Cartesian co-ords [x y]
                    r.speed=varargin{4};             %number of kilometres vaccinated can migrate in 1 day
                    r.last_breed=varargin{5};        %number of iterations since vaccinated last reproduced.
                otherwise
                    error('Invalid no. of input arguments')
            end
        end
    end
end
