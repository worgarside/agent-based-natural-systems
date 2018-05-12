function [new_agents] = update_messages(agent, prev_agt_count, new_agt_count)

% the function called right at the end of each step to apply all the
% updates calculated in the previous functions
% agent = matrix of all agent objects
% prev_agt_count = number of agents at the end of the previous step
% new_agent_count = number of agents at the end of this step

global MESSAGES IT_STATS STEP_NUM

new_agents = cell(1, new_agt_count);    % empty matrix for new agent objects
new_count = 0;                          % initialise counter for new agents

for i = 1:new_agt_count
    if i < prev_agt_count   % if the agent isn't new, they need to be processed
        if isempty(agent{i})
            dead =  true;   % already died in a previous step
        else
            dead = MESSAGES.dead(i); % might have died this step, so check the MESSAGE board
        end
        
        % update the transformation flags
        new_infec = MESSAGES.new_infec(i);  
        new_vacc = MESSAGES.new_vacc(i);
        new_susc = MESSAGES.new_susc(i);
    else    % if the agent is new, set their atttributes and messages
        MESSAGES.age(i) = 0;        
        dead = false;
        MESSAGES.dead(i) = false;
        new_infec = false;
        MESSAGES.new_infec(i) = false;
        new_vacc = false;
        MESSAGES.new_vacc(i) = false;
        new_susc = false;
        MESSAGES.new_susc(i) = false;
    end
    
    % deal with agent transformations and set new attributes and messages
    if new_infec
        nx = MESSAGES.pos(i, 1);
        ny = MESSAGES.pos(i, 2);
        npos = [nx ny];
        
        age = get(agent{i}, 'age');
        last_breed = get(agent{i}, 'last_breed');
        
        new_agents{i} = infected(age, npos, STEP_NUM+1, last_breed);
        MESSAGES.atype(i) = 3;
        MESSAGES.new_infec(i) = false;
        new_count = new_count + 1;
    elseif new_vacc
        nx = MESSAGES.pos(i, 1);
        ny = MESSAGES.pos(i, 2);
        npos = [nx ny];
        
        age = get(agent{i}, 'age');
        last_breed = get(agent{i}, 'last_breed');
        
        new_agents{i} = vaccinated(age, npos, last_breed);

        MESSAGES.atype(i) = 2;
        MESSAGES.new_vacc(i) = false;
        MESSAGES.new_susc(i) = false;
        new_count = new_count + 1;
    elseif new_susc
        nx = MESSAGES.pos(i, 1);
        ny = MESSAGES.pos(i, 2);
        npos = [nx ny];
        
        age = get(agent{i}, 'age');
        last_breed = get(agent{i}, 'last_breed');
        
        new_agents{i} = susceptible(age, npos, last_breed);

        MESSAGES.atype(i) = 1;
        MESSAGES.new_vacc(i) = false;
        MESSAGES.new_susc(i) = false;
        new_count = new_count + 1;
    elseif dead
        MESSAGES.pos(i,:) = [-1 -1];     % enter dummy position in list
        MESSAGES.atype(i) = 0;           % set type to dead
        MESSAGES.dead(i) = false;        % clear death message
    else
        % no change for this agent, so just copy them over and update the
        % stats
        new_agents{i} = agent{i};  % copy object into the new list
        MESSAGES.pos(i,:) = get(agent{i}, 'pos');
        MESSAGES.age(i) = get(agent{i}, 'age');
        MESSAGES.last_breed(i) = get(agent{i}, 'last_breed');
        if isa(agent{i}, 'susceptible')
            MESSAGES.atype(i) = 1;
            IT_STATS.susceptible(STEP_NUM+1) = IT_STATS.susceptible(STEP_NUM+1) + 1;
        elseif isa(agent{i}, 'vaccinated')
            MESSAGES.atype(i) = 2;
            IT_STATS.vaccinated(STEP_NUM+1) = IT_STATS.vaccinated(STEP_NUM+1) + 1;
        elseif isa(agent{i}, 'infected')
            MESSAGES.atype(i) = 3;
            IT_STATS.infected(STEP_NUM+1) = IT_STATS.infected(STEP_NUM+1) + 1;
        end
        new_count = new_count + 1;
    end
end
IT_STATS.agt_count(STEP_NUM+1) = new_count;  % update total agent number