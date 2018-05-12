function [agt, new] = breed(agt)

% breeding function for class VACCINATED
% agt = infected agent
% new = new agent object if created, otherwise empty

% PARAM is structure containing constant parameters for simulation
global PARAM

last_breed = agt.last_breed;    % number of steps since agent bred
pos = agt.pos;                  % current agent position

% Check sufficient time has passed for breeding and give random chance
if last_breed >= PARAM.VACC_BREED_FREQ && PARAM.VACC_BREED_CHANCE > rand
    % Create new agent with new parameters, and reset breeding counter
    age = 0;
    last_breed = 0;    
    new = vaccinated(age, pos, last_breed);
    agt.last_breed = 0;
else
    % Increment counter and return empty object
    agt.last_breed = last_breed + 1;
    new = [];
end