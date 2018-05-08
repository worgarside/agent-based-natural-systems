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
    MESSAGES.new_infec(agt_index)=0;
end