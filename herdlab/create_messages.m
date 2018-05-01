function create_messages(nr,nf,agent)

%function that populates the global data structure representing
%message information

%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=vaccinated, 2-infected, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
 global MESSAGES
 
 for agt_index = 1:length(agent)
     if isa(agent{agt_index},'vaccinated')
        MESSAGES.atype(agt_index) = 1;
        MESSAGES.pos(agt_index,:) = get(agent{agt_index},'pos');
        MESSAGES.age(agt_index,:) = get(agent{agt_index}, 'age');
     elseif isa(agent{agt_index}, 'infected')
        MESSAGES.atype(agt_index) = 2;
        MESSAGES.pos(agt_index,:) = get(agent{agt_index}, 'pos');
%         MESSAGES.age(agt_index,:) = get(agent{agt_index}, 'age'); % Don't
%         need to store this
     else
        MESSAGES.atype(agt_index) = 0; 
        MESSAGES.pos(agt_index,:) = [-1 -1];
     end
     MESSAGES.dead(agt_index)=0;
 end
     
