function [nagent, agt_count] = update_messages(agent, prev_n, temp_n)

global MESSAGES IT_STATS STEP_NUM

nagent = cell(1,temp_n);                  % initialise list for surviving agents
agt_count = 0;                                   % tracks number of surviving agents

for agt_index = 1:temp_n
    if isempty(agent{agt_index})               % agent died in a previous iteration (not the current one)
        new_infec = true;
    elseif agt_index <= prev_n                   % agent is not new, therefore it might have died
        new_infec = MESSAGES.new_infec(agt_index);         % will be one for agents that have died, zero otherwise
    else
        new_infec = false;
    end
    if ~new_infec                   % if agent is not newly infected
        nagent{agt_index} = agent{agt_index};           % copy object into the new list
        MESSAGES.pos(agt_index,:) = get(agent{agt_index}, 'pos');
        
        if isa(agent{agt_index}, 'vulnerable')
            MESSAGES.atype(agt_index) = 1;
            IT_STATS.vulnerable(STEP_NUM+1) = IT_STATS.vulnerable(STEP_NUM+1) + 1;
        elseif isa(agent{agt_index}, 'vaccinated')
            MESSAGES.atype(agt_index) = 2;
            IT_STATS.vaccinated(STEP_NUM+1) = IT_STATS.vaccinated(STEP_NUM+1) + 1;
        elseif isa(agent{agt_index}, 'infected')
            MESSAGES.atype(agt_index) = 3;
            IT_STATS.infected(STEP_NUM+1) = IT_STATS.infected(STEP_NUM+1)+1;
        end
        
        MESSAGES.new_infec(agt_index) = 0;           % clear infected message
        agt_count = agt_count + 1;
    else                                % agent has died
        MESSAGES.pos(agt_index, :) = [-1 -1];     % enter dummy position in list
        MESSAGES.atype(agt_index) = 0;           % set type to dead
        MESSAGES.new_infec(agt_index) = 0;            % clear infected message
    end
end
IT_STATS.tot(STEP_NUM+1)=agt_count;                % update total agent number