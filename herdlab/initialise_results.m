function initialise_results(vacc_count, inf_count, nsteps)

global  IT_STATS

%set up data structure to record statistics for each model iteration
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc)

IT_STATS=struct(...
    'vaccinated', zeros(1, nsteps+1),...      % vaccinated count
    'infected', zeros(1, nsteps+1),...        % infected count
    'infections', zeros(1, nsteps+1),...      % new infections
    'migrations', zeros(1, nsteps+1),...      % migrations
    'agent_count', zeros(1, nsteps+1),...     % total agent count
    'dead_infected', zeros(1, nsteps+1)...    % dead infected
);

IT_STATS.tot(1)=vacc_count+inf_count;
IT_STATS.vaccinated(1)=vacc_count;
IT_STATS.infected(1)=inf_count;