function print_step_stats(step_count)

% prints the main statistics of step i to the console
% step_count = total number of steps

global IT_STATS STEP_NUM

fprintf('\n     Step %04i: %3.0f%%', STEP_NUM, (STEP_NUM/step_count)*100);
fprintf('    Total: %05i', IT_STATS.agt_count(STEP_NUM));
fprintf('    Susc:  %05i', IT_STATS.susceptible(STEP_NUM));
fprintf('    Vacc:  %05i', IT_STATS.vaccinated(STEP_NUM));
fprintf('    Infec: %05i', IT_STATS.infected(STEP_NUM));

end