function create_messages(nr,nf,agent)

global MESSAGES

for agt_index = 1:length(agent)
    if isa(agent{agt_index},'vaccinated')
        MESSAGES.atype(agt_index) = 1;
        MESSAGES.pos(agt_index,:) = get(agent{agt_index},'pos');
        MESSAGES.age(agt_index,:) = get(agent{agt_index}, 'age');
    elseif isa(agent{agt_index}, 'infected')
        MESSAGES.atype(agt_index) = 2;
        MESSAGES.pos(agt_index,:) = get(agent{agt_index}, 'pos');
    else
        disp('error')
        MESSAGES.atype(agt_index) = 0;
        MESSAGES.pos(agt_index,:) = [-1 -1];
    end
    MESSAGES.new_infec(agt_index)=0;
end

