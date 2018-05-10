function create_messages(agent)

global MESSAGES

for agt_index = 1:length(agent)
    if isa(agent{agt_index},'vulnerable')
        MESSAGES.atype(agt_index) = 1;
    elseif isa(agent{agt_index},'vaccinated')
        MESSAGES.atype(agt_index) = 2;
    elseif isa(agent{agt_index}, 'infected')
        MESSAGES.atype(agt_index) = 3;
    end
    
    MESSAGES.pos(agt_index,:) = get(agent{agt_index},'pos');
    MESSAGES.age(agt_index) = get(agent{agt_index}, 'age');
    MESSAGES.last_breed(agt_index) = get(agent{agt_index}, 'last_breed');
    MESSAGES.new_infec(agt_index) = false;
    MESSAGES.new_vacc(agt_index) = false;
    MESSAGES.new_vuln(agt_index) = false;
    MESSAGES.dead(agt_index) = false;
end