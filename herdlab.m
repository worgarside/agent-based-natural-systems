function herdlab(...
    env_size,...
    vuln_count,...
    vacc_count,...
    infec_count,...
    step_count,...
    lethality,...
    plot_control,...
    quick_stop,...
    img_output...
    )

clear global
close all

global STEP_NUM IT_STATS MESSAGES

switch nargin
    case 0
        disp('Add arguments in this order: env_size, vuln_count, vacc_count, infec_count, step_count, [curability], [lethality], [plot_control], [img_output]');
        return
    case 6
        plot_control = 1;
        quick_stop = true;
        img_output = false;
    case 7
        quick_stop = true;
        img_output = false;
    case 8
        img_output = false;
    case 9
    otherwise
        disp('Not enough args: env_size, vuln_count, vacc_count, infec_count, step_count, [fast_mode], [img_output]');
        return
end

create_control;
create_params(lethality);
create_environment(env_size);
random_selection(0);
[agent] = create_agents(vuln_count, vacc_count, infec_count);
create_messages(agent);
initialise_results(vuln_count, vacc_count, infec_count, step_count);

fprintf('\n     Step 0000: 000%%');
fprintf('    Total: %05i', length(agent));
fprintf('    Vuln:  %05i', vuln_count);
fprintf('    Vacc:  %05i', vacc_count);
fprintf('    Infec: %05i', infec_count);

for i = 1:step_count
    STEP_NUM = i;
    [agent] = agnt_solve(agent);
    
    if plot_control ~= 1
        if mod(i, 100) == 0
           print_step_stats(i, step_count);
        end
    end
    
    if plot_control == 0 && STEP_NUM == step_count
        r_zero = calc_r_zero();
        
        print_step_stats(i, step_count);
        
        plot_results(agent, vuln_count, vacc_count, infec_count, r_zero, img_output);
    elseif mod(i, plot_control) == 0
        r_zero = calc_r_zero();
        print_step_stats(i, step_count);
        plot_results(agent, vuln_count, vacc_count, infec_count, r_zero, img_output);
    end
    
    if vuln_count > 0 && IT_STATS.vulnerable(i) == 0 && quick_stop
        disp('No vulnerable agents');
        r_zero = calc_r_zero();
        print_step_stats(i, step_count);
        plot_results(agent, vuln_count, vacc_count, infec_count, r_zero, img_output);
        break
    end
    if infec_count > 0 && IT_STATS.infected(i) == 0 && quick_stop
        disp('No infected left');
        r_zero = calc_r_zero();
        print_step_stats(i, step_count);
        plot_results(agent, vuln_count, vacc_count, infec_count, r_zero, img_output);
        break
    end
end

fprintf('\n\n');
clear global
