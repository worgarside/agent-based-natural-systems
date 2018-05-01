function [agent]=create_agents(healthy_count,infected_count)

%creates the objects representing each agent

%agent - cell array containing list of objects representing agents
%healthy_count - number of rabbits
%infected_count - number of foxes

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global ENV_DATA MESSAGES PARAM

bm_size=ENV_DATA.bm_size;
healthy_loc=(bm_size-1)*rand(healthy_count,2)+1;      %generate random initial positions for healthy agents

MESSAGES.pos=healthy_loc;

%generate all rabbit agents and record their positions in ENV_MAT_R
for r=1:healthy_count
    vaccinated=true;
    health=50;
    immune=true;
    carrier=false;
    pos=healthy_loc(r,:);
    
    agent{r}=healthy(vaccinated,health,immune,carrier,pos);
end
