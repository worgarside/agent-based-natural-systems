function herdlab(env_size, vuln_count, vacc_count, infec_count, step_count, plot_control, quick_stop, img_output)

clear global
close all

global STEP_NUM IT_STATS

switch nargin
    case 0
        disp('Add arguments in this order: env_size, vuln_count, vacc_count, infec_count, step_count, [plot_control], [img_output]');
        return
    case 5
        plot_control = 1;
        quick_stop = true;
        img_output = false;
    case 6
        quick_stop = true;
        img_output = false;
    case 7        
        img_output = false;
    otherwise
        disp('Not enough args: env_size, vuln_count, vacc_count, infec_count, step_count, [fast_mode], [img_output]');
        return
end

total_agents_count = vuln_count  + vacc_count + infec_count;
fprintf('Starting the simulation with %i agents, and updating plots every %i steps.\n', total_agents_count, plot_control);
disp('Press any key to continue');
pause;

create_control;
create_params;
create_environment(env_size);
random_selection(1);
[agent] = create_agents(vuln_count, vacc_count, infec_count);
create_messages(agent);
initialise_results(vuln_count, vacc_count, infec_count, step_count);

fprintf('\nStep 0, 0%% \n');
fprintf('    Total Agents: %i\n', IT_STATS.agt_count(STEP_NUM));
fprintf('    Vulnerable:   %i\n', IT_STATS.vulnerable(STEP_NUM));
fprintf('    Vaccinated:   %i\n', IT_STATS.vaccinated(STEP_NUM));
fprintf('    Infected:     %i\n', IT_STATS.infected(STEP_NUM));

for i = 1:step_count
    STEP_NUM = i;
    [agent] = agnt_solve(agent);
    
    if plot_control ~= 1
        if mod(i, 100) == 0
            fprintf('\nStep %i, %i%% \n', i, (i/step_count)*100);
            fprintf('    Total Agents: %i\n', IT_STATS.agt_count(STEP_NUM));
            fprintf('    Vulnerable:   %i\n', IT_STATS.vulnerable(STEP_NUM));
            fprintf('    Vaccinated:   %i\n', IT_STATS.vaccinated(STEP_NUM));
            fprintf('    Infected:     %i\n', IT_STATS.infected(STEP_NUM));
        end
    end
    
    if plot_control == 0 && STEP_NUM == step_count
        plot_results(agent, img_output);
    elseif mod(i, plot_control) == 0
        plot_results(agent, img_output);
    end
    
    if vuln_count > 0 && IT_STATS.vulnerable(i) == 0 && quick_stop
        disp('No vulnerable agents')
        plot_results(agent, img_output);
        break
    end
    if infec_count > 0 && IT_STATS.infected(i) == 0 && quick_stop
        disp('No infected left')
        plot_results(agent, img_output);
        break
    end
end

clear global
