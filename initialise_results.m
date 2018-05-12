function initialise_results(vuln_count, vacc_count, inf_count, nsteps)

global  IT_STATS

IT_STATS = struct(...
    'susceptible', zeros(1, nsteps+1),...   % susceptible count
    'vaccinated', zeros(1, nsteps+1),...    % vaccinated count
    'infected', zeros(1, nsteps+1),...      % infected count
    'agt_count', zeros(1, nsteps+1)...      % total agent count
);

IT_STATS.agt_count(1) = vuln_count + vacc_count + inf_count;
IT_STATS.susceptible(1) = vuln_count;
IT_STATS.vaccinated(1) = vacc_count;
IT_STATS.infected(1) = inf_count;