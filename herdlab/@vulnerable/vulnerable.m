classdef vulnerable
    properties
        age;
        health;
        pos;
        carrier;
        immune;
    end
    methods
        function vuln = vulnerable(varargin)
            switch nargin
                case 0
                    vuln.age = [];
                    vuln.health = [];
                    vuln.pos = [];
                    vuln.carrier = [];
                    vuln.immune = [];
                case 1
                    if (isa(varargin{1},'vulnerable'))
                        vuln = varargin{1};
                    else
                        error('Input argument is not vulnerable')
                    end
                case 5
                    vuln.age = varargin{1};
                    vuln.health = varargin{2};
                    vuln.pos = varargin{3};
                    vuln.carrier = varargin{4};
                    vuln.immune = varargin{5};
                    
                otherwise
                    error('Invalid no. of input arguments')
            end
        end
    end
end
