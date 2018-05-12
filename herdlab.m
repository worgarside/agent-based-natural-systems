function herdlab(...
    env_size,...
    susc_count,...
    vacc_count,...
    infec_count,...
    step_count,...
    plot_control,...
    quick_stop,...
    img_output...
    )

clear global
close all

global STEP_NUM IT_STATS

switch nargin
    case 0
        disp('Add arguments in this order: env_size, susc_count, vacc_count, infec_count, step_count, [plot_control], [quick_stop], [img_output]');
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
    case 8
    otherwise
        disp('Not enough args: env_size, susc_count, vacc_count, infec_count, step_count, [plot_control], [quick_stop], [img_output]');
        return
end

% ==================== Initialise Model ==================== %

create_params;
create_environment(env_size);
[agent] = create_agents(susc_count, vacc_count, infec_count);
create_messages(agent);
initialise_results(susc_count, vacc_count, infec_count, step_count);

fprintf('\n     Step 0000: 000%%');
fprintf('    Total: %05i', length(agent));
fprintf('    Susc:  %05i', susc_count);
fprintf('    Vacc:  %05i', vacc_count);
fprintf('    Infec: %05i', infec_count);

% ==================== Main Loop ==================== %

for i = 1:step_count
    STEP_NUM = i;
    [agent] = agnt_solve(agent);
    
    % Print model stats every 100 steps for progress tracking
    if mod(i, 100) == 0
        print_step_stats(step_count);
    end
        
    if plot_control == 0 && STEP_NUM == step_count
        % Output plot on final step to speed up model processing
        r_zero = calc_r_zero();
        print_step_stats(step_count);
        plot_results(agent, susc_count, vacc_count, infec_count, r_zero, img_output);
    elseif mod(i, plot_control) == 0
        % Output plot every x steps, defined by user
        r_zero = calc_r_zero();
        print_step_stats(step_count);
        plot_results(agent, susc_count, vacc_count, infec_count, r_zero, img_output);
    end
    
    if susc_count > 0 && IT_STATS.susceptible(i) == 0 && quick_stop
        % If there are no susceptible agents, but there were some at the
        % start, calculate R0 for the simulation and plot the graph
        disp('No susceptible agents');
        r_zero = calc_r_zero();
        print_step_stats(step_count);
        plot_results(agent, susc_count, vacc_count, infec_count, r_zero, img_output);
        break
    end
    
    if infec_count > 0 && IT_STATS.infected(i) == 0 && quick_stop
        % If there are no infected agents, but there were some at the
        % start, calculate R0 for the simulation and plot the graph
        disp('No infected left');
        r_zero = calc_r_zero();
        print_step_stats(step_count);
        plot_results(agent, susc_count, vacc_count, infec_count, r_zero, img_output);
        break
    end
end

fprintf('\n\n');
clear global
