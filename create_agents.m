function [agent] = create_agents(susc_count, vacc_count,infec_count)

% Creates all agents and puts them into the arena at the start of the
% simulation
% susc_count = number of susceptible agents
% vacc_count = number of vaccinated agents
% infec_count = number of infcted agents
% [agent] = matrix of agents to start the simulation with

global ENV_DATA MESSAGES PARAM

size = ENV_DATA.size;

% generate random initial positions
susc_loc = (size-1)*rand(susc_count, 2)+1;
vacc_loc = (size-1)*rand(vacc_count, 2)+1;
infec_loc = (size-1)*rand(infec_count, 2)+1;

MESSAGES.pos=[susc_loc;vacc_loc;infec_loc];

% ==================== Susceptible ==================== %

for susc = 1 : susc_count
    age = ceil(rand*PARAM.SUSC_MAX_AGE);    % randomise age between 0 and MAX_AGE
    pos = susc_loc(susc,:);
    last_breed = ceil(rand*PARAM.SUSC_BREED_FREQ);
    
    agent{susc} = susceptible(age, pos, last_breed);
end

% ==================== Vaccinated ==================== %

for vacc = susc_count+1 : susc_count+vacc_count
    age = ceil(rand*PARAM.VACC_MAX_AGE);    % randomise age between 0 and MAX_AGE
    pos = vacc_loc(vacc-susc_count,:);      % take position from matrix
    last_breed = ceil(rand*PARAM.VACC_BREED_FREQ);
    
    agent{vacc} = vaccinated(age, pos, last_breed);
end

% ==================== Infected ==================== %

for infec = susc_count+vacc_count+1 : susc_count+vacc_count+infec_count
    % randomise all values between 0 and their maximum value
    
    age = ceil(rand*PARAM.INFEC_MAX_AGE);
    pos = infec_loc(infec-(susc_count+vacc_count),:);   % take position from matrix
    infection_step = ceil(rand*PARAM.INFEC_DEATH_DELAY);
    last_breed = ceil(rand*PARAM.INFEC_BREED_FREQ);
    
    agent{infec} = infected(age, pos, infection_step, last_breed);
end
