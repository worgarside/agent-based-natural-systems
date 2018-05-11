function create_messages(agent)

global MESSAGES IT_STATS

for i = 1:length(agent)
    if isa(agent{i},'vulnerable')
        MESSAGES.atype(i) = 1;
    elseif isa(agent{i},'vaccinated')
        MESSAGES.atype(i) = 2;
    elseif isa(agent{i}, 'infected')
        MESSAGES.atype(i) = 3;
    end
    
    MESSAGES.pos(i,:) = get(agent{i},'pos');
    MESSAGES.age(i) = get(agent{i}, 'age');
    MESSAGES.last_breed(i) = get(agent{i}, 'last_breed');
    MESSAGES.new_infec(i) = false;
    MESSAGES.new_vacc(i) = false;
    MESSAGES.new_vuln(i) = false;
    MESSAGES.dead(i) = false;
    MESSAGES.infections_passed(i) = 0;
end