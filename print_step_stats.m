function print_step_stats(i, step_count)

global IT_STATS STEP_NUM

fprintf('\n     Step %04i: %3.2f%%', i, (i/step_count)*100);
fprintf('    Total: %05i', IT_STATS.agt_count(STEP_NUM));
fprintf('    Vuln:  %05i', IT_STATS.vulnerable(STEP_NUM));
fprintf('    Vacc:  %05i', IT_STATS.vaccinated(STEP_NUM));
fprintf('    Infec: %05i', IT_STATS.infected(STEP_NUM));

end

