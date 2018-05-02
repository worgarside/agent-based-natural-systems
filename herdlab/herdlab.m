function herdlab(env_size, vacc_count, infec_count, step_count, fast_mode, img_output)

clear global
close all

global STEP_NUM IT_STATS ENV_DATA CONTROL_DATA

if nargin == 4
    fast_mode=true;
    img_output=false;
elseif nargin == 5
    img_output=false;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MODEL INITIALISATION
create_control;                     %sets up the parameters to control fmode (speed up the code during experimental testing
create_params;                      %sets the parameters for this simulation
create_environment(env_size);           %creates environment data structure, given an environment size
random_selection(1);                %randomises random number sequence (NOT agent order). If input=0, then simulation should be identical to previous for same initial values
[agent] = create_agents(vacc_count, infec_count);       %create vaccinated and infected agents and places them in a cell array called 'agents'
create_messages(vacc_count, infec_count, agent);       %sets up the initial message lists
initialise_results(vacc_count, infec_count, step_count);   %initialises structure for storing results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%MODEL EXECUTION
for step_num = 1:step_count                   %the main execution loop
    STEP_NUM = step_num;
    [agent, n] = agnt_solve(agent);     %the function which calls the rules
    plot_results(agent, step_count, fast_mode, img_output); %updates results figures and structures
    
    if n<=0                          %if no more agents, then stop simulation
        disp('General convergence criteria satisfied - no agents left alive! > ')
        break
    end
    if fast_mode                                       % if fastmode is used ...
        for test_l = 1 : 5                                    % this checks the total number agents and adjusts the CONTROL_DATA.fmode_display_every variable accoringly to help prevent extreme slowdown
            if n > CONTROL_DATA.fmode_control(1,test_l)     % CONTROL_DATA.fmode_control contains an array of thresholds for agent numbers and associated fmode_display_every values
                CONTROL_DATA.fmode_display_every = CONTROL_DATA.fmode_control(2,test_l);
            end
        end
        if IT_STATS.vaccinated(step_num) == 0 
            disp('Fast mode convergence criteria satisfied - no vaccinateds left alive! > ')
            break
        end
        if IT_STATS.infected(step_num) == 0
            disp('Fast mode convergence criteria satisfied - no infectedes left alive ! > ')
            break
        end
    end
end

eval(['save results_nr_' num2str(vacc_count) '_nf_' num2str(infec_count) '.mat IT_STATS ENV_DATA' ]);
clear global
