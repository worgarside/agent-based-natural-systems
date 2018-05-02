function create_params

%set up breeding, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.VACC_SPEED=5;         %speed of movement - units per itn (vaccinated)
    PARAM.INFEC_SPEED=5;         %speed of movement - units per itn (infected)    