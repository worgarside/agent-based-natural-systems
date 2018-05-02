function [agt, new]=infect(agt,cn)

global  IT_STATS STEP_NUM MESSAGES

pos=agt.pos;
spd=2;

typ = MESSAGES.atype;                                         %extract types of all agents
vacc_indices = find(typ==1);                                            %indices of all vaccinateds
vacc_pos = MESSAGES.pos(vacc_indices,:);                                     %extract positions of all vaccinated
dist = sqrt((vacc_pos(:,1)-pos(:,1)).^2+(vacc_pos(:,2)-pos(:,2)).^2);  %calculate distance to all vaccinated
[d, ind] = min(dist);                                            %d is distance to closest vaccinated, ind is index of that vaccinated
nrst = vacc_indices(ind);                                                %index of nearest vaccinated(s)
new = [];

if d<=spd & length(nrst)>0  %if there is at least one  vaccinated within the search radius
    
    if length(nrst)>1       %if more than one vaccinated located at same distance then randomly pick one
        s = round(rand*(length(nrst)-1))+1;
        nrst = nrst(s);
    end
    
    pk = 1-(d/spd);   %probability that infected will infect vaccinated is ratio of speed to distance
    
    if pk > rand
        nx = MESSAGES.pos(nrst,1);    %extract exact location of this vaccinated
        ny = MESSAGES.pos(nrst,2);
        npos = [nx ny];
        
        new = infected(MESSAGES.age(nrst), 50, npos);
        
        IT_STATS.infections(STEP_NUM+1) = IT_STATS.infections(STEP_NUM+1)+1;                %update model statistics
        MESSAGES.new_infec(nrst) = true;       % send message to vaccinated so it knows it's infected!
    end
end