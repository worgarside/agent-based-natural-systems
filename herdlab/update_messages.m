function [new_agents] = update_messages(agent, agt_count)

global MESSAGES IT_STATS STEP_NUM

new_agents = cell(1, agt_count);  % initialise agent list for next iteration
new_count = 0;

for i = 1:agt_count
    if isempty(agent{i})  % agent died in a previous iteration (not the current one)
        new_infec = true;
    else
        new_infec = MESSAGES.new_infec(i);  % will be one for agents that have died, zero otherwise
    end
    if ~new_infec  % if agent is not newly infected
        new_agents{i} = agent{i};  % copy object into the new list
        MESSAGES.pos(i,:) = get(agent{i}, 'pos');
        
        if isa(agent{i}, 'vulnerable')
            MESSAGES.atype(i) = 1;
            IT_STATS.vulnerable(STEP_NUM+1) = IT_STATS.vulnerable(STEP_NUM+1) + 1;
        elseif isa(agent{i}, 'vaccinated')
            MESSAGES.atype(i) = 2;
            IT_STATS.vaccinated(STEP_NUM+1) = IT_STATS.vaccinated(STEP_NUM+1) + 1;
        elseif isa(agent{i}, 'infected')
            MESSAGES.atype(i) = 3;
            IT_STATS.infected(STEP_NUM+1) = IT_STATS.infected(STEP_NUM+1) + 1;
        end
        
        MESSAGES.new_infec(i) = 0;  % clear infected message
        new_count = new_count + 1;
    else  % agent has been infected
        nx = MESSAGES.pos(i, 1);  % extract exact location of this vaccinated
        ny = MESSAGES.pos(i, 2);
        npos = [nx ny];
        
        new_agents{i} = infected(MESSAGES.age(i), 50, npos, STEP_NUM+1);  % change agent type
        MESSAGES.atype(i) = 3;  % set type to infected
        MESSAGES.new_infec(i) = false;  % clear infected message
        new_count = new_count + 1;
    end
end
IT_STATS.agt_count(STEP_NUM+1)=new_count;  % update total agent number