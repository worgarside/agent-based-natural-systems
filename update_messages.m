function [new_agents] = update_messages(agent, prev_agt_count, new_agt_count)

global MESSAGES IT_STATS STEP_NUM

new_agents = cell(1, new_agt_count);
new_count = 0;

for i = 1:new_agt_count
    if i < prev_agt_count
        if isempty(agent{i})
            dead =  true;
        else
            dead = MESSAGES.dead(i);
        end
        
        new_infec = MESSAGES.new_infec(i);
        new_vacc = MESSAGES.new_vacc(i);
        new_vuln = MESSAGES.new_vuln(i);
    else
        MESSAGES.age(i) = 0;
        
        dead = false;
        MESSAGES.dead(i) = false;
        new_infec = false;
        MESSAGES.new_infec(i) = false;
        new_vacc = false;
        MESSAGES.new_vacc(i) = false;
        new_vuln = false;
        MESSAGES.new_vuln(i) = false;
        
    end
    
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
    elseif new_vacc || new_vuln
        nx = MESSAGES.pos(i, 1);
        ny = MESSAGES.pos(i, 2);
        npos = [nx ny];
        
        age = get(agent{i}, 'age');
        last_breed = get(agent{i}, 'last_breed');
        
        new_agents{i} = vaccinated(age, npos, last_breed);

        MESSAGES.atype(i) = 2;
        MESSAGES.new_vacc(i) = false;
        MESSAGES.new_vuln(i) = false;
        new_count = new_count + 1;
    elseif dead
        MESSAGES.pos(i,:) = [-1 -1];     %enter dummy position in list
        MESSAGES.atype(i) = 0;           %set type to dead
        MESSAGES.dead(i) = 0;            %clear death message
    else
        new_agents{i} = agent{i};  % copy object into the new list
        MESSAGES.pos(i,:) = get(agent{i}, 'pos');
        MESSAGES.age(i) = get(agent{i}, 'age');
        MESSAGES.last_breed(i) = get(agent{i}, 'last_breed');
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
        new_count = new_count + 1;
    end
end
IT_STATS.agt_count(STEP_NUM+1) = new_count;  % update total agent number