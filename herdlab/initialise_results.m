function initialise_results(vuln_count, vacc_count, inf_count, nsteps)

global  IT_STATS

IT_STATS=struct(...
    'vulnerable', zeros(1, nsteps+1),...      % vaccinated count
    'vaccinated', zeros(1, nsteps+1),...      % vaccinated count
    'infected', zeros(1, nsteps+1),...        % infected count
    'infections', zeros(1, nsteps+1),...      % new infections
    'migrations', zeros(1, nsteps+1),...      % migrations
    'agent_count', zeros(1, nsteps+1),...     % total agent count
    'dead_infected', zeros(1, nsteps+1)...    % dead infected
);

IT_STATS.tot(1) = vuln_count + vacc_count + inf_count;
IT_STATS.vulnerable(1) = vuln_count;
IT_STATS.vaccinated(1) = vacc_count;
IT_STATS.infected(1) = inf_count;