classdef infected           %declares infected object
    properties         %define infected properties (parameters)
        age;            % age
        health;         % food
        pos;            % last_breed
    end
    methods                         %note that this class definition mfile contains only the constructor method!
        %all additional member functions associated with this class are included as separate mfiles in the @infected folder.
        function f=infected(varargin) %constructor method for infected  - assigns values to infected properties
            %f=infected(age,food,pos....)
            %age of agent (usually 0)
            %food - amount of food that infected has eaten
            %pos - vector containg x,y, co-ords
            
            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                    f.age=[];
                    f.health=[];
                    f.pos=[];
                case 1                         %input is already a infected, so just return!
                    if (isa(varargin{1},'infected'))
                        f=varargin{1};
                    else
                        error('Input argument is not a infected')
                    end
                case 3                        %create a new infected (currently the only constructor method used)
                    f.age=varargin{1};               %age of infected object in number of iterations
                    f.health=varargin{2};              %current food content (arbitrary units)
                    f.pos=varargin{3};               %current position in Cartesian co-ords [x y]
                otherwise
                    error('Invalid no. of input arguments for infected')
            end
        end
    end
end