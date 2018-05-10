function herdlab(...
    env_size,...
    vuln_count,...
    vacc_count,...
    infec_count,...
    step_count,...
    curability,...
    lethality,...
    plot_control,...
    quick_stop,...
    img_output...
    )

clear global
close all

global STEP_NUM IT_STATS

switch nargin
    case 0
        disp('Add arguments in this order: env_size, vuln_count, vacc_count, infec_count, step_count, [curability], [lethality], [plot_control], [img_output]');
        return
    case 6
        disp('Please add both curability AND lethality');
    case 7
        plot_control = 1;
        quick_stop = true;
        img_output = false;
    case 8
        quick_stop = true;
        img_output = false;
    case 9
        img_output = false;
    case 10
    otherwise
        disp('Not enough args: env_size, vuln_count, vacc_count, infec_count, step_count, [fast_mode], [img_output]');
        return
end

total_agents_count = vuln_count  + vacc_count + infec_count;
% fprintf('   Running with %i agents, and updating plots every %i steps.', total_agents_count, plot_control);
% disp('Press any key to continue');pause;

create_control;
create_params(curability, lethality);
create_environment(env_size);
random_selection(1);
[agent] = create_agents(vuln_count, vacc_count, infec_count);
create_messages(agent);
initialise_results(vuln_count, vacc_count, infec_count, step_count);

fprintf('     Step 0000: 000%%');
fprintf('    Total: %05i', length(agent));
fprintf('    Vuln:  %05i', vuln_count);
fprintf('    Vacc:  %05i', vacc_count);
fprintf('    Infec: %05i', infec_count);

for i = 1:step_count
    STEP_NUM = i;
    [agent] = agnt_solve(agent);
    
    if plot_control ~= 1
        if mod(i, 100) == 0
            fprintf('\n     Step %04i: %03i%%', i, (i/step_count)*100);
            fprintf('    Total: %05i', IT_STATS.agt_count(STEP_NUM));
            fprintf('    Vuln:  %05i', IT_STATS.vulnerable(STEP_NUM));
            fprintf('    Vacc:  %05i', IT_STATS.vaccinated(STEP_NUM));
            fprintf('    Infec: %05i', IT_STATS.infected(STEP_NUM));
        end
    end
    
    if plot_control == 0 && STEP_NUM == step_count
        plot_results(agent, vuln_count, vacc_count, infec_count, curability, lethality, img_output);
    elseif mod(i, plot_control) == 0
        plot_results(agent, vuln_count, vacc_count, infec_count, curability, lethality, img_output);
    end
    
    if vuln_count > 0 && IT_STATS.vulnerable(i) == 0 && quick_stop
        disp('No vulnerable agents')
        plot_results(agent, vuln_count, vacc_count, infec_count, curability, lethality, img_output);
        break
    end
    if infec_count > 0 && IT_STATS.infected(i) == 0 && quick_stop
        disp('No infected left')
        plot_results(agent, vuln_count, vacc_count, infec_count, curability, lethality, img_output);
        break
    end
end

clear global
