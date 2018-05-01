classdef healthy
    % Summary of this class goes here
    % Detailed explanation goes here
    
    properties
        vaccinated;
        health;
        immune;
        carrier;
        pos;
    end
    
    methods
        function h=healthy(varargin) %constructor method for fox  - assigns values to fox properties
                % h=healthy(vaccinated, infection, immune, carrier, pos)
                %
                % vaccinated, immune, carrier = Boolean
                % health = int
                % pos = vector [x, y]
          
            switch nargin                     % Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        % create default object
                    h.vaccinated=[];			
                    h.health=[];
                    h.immune=[];
                    h.carrier=[];
                    h.pos=[];
                case 1
                    if (isa(varargin{1},'healthy'))		
                        h=varargin{1};
                    else
                        error('Input argument is not a valid healthy')
                    end
                case 5                          % create a new healthy (currently the only constructor method used)
                    h.vaccinated=varargin{1};   % boolean vaccination status
                    h.health=varargin{2};       % continuous health state (100 = no infection, 1 = about to become zombie-esque)
                    h.immune=varargin{3};       % boolean natural immunity status
                    h.carrier=varargin{4};      % boolean disease carrier flag
                    h.pos=varargin{5};          % current position in Cartesian co-ords [x y]
                otherwise
                    error('Invalid no. of input arguments')
            end
        end
    end
end

