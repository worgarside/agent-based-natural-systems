function infect(agt)

global  IT_STATS STEP_NUM MESSAGES PARAM

pos = agt.pos;
spd = PARAM.INFEC_SPEED;

typ = MESSAGES.atype;  % extract types of all agents
vuln_indices = find(typ == 1);  % indices of all vulnerable
vuln_pos = MESSAGES.pos(vuln_indices,:);  % extract positions of all vulnerable
dist = sqrt((vuln_pos(:,1)-pos(:,1)).^2+(vuln_pos(:,2)-pos(:,2)).^2);  % calculate distance to all vulnerable
[d, ind] = min(dist);  % d is distance to closest vulnerable, ind is index of that vaccinated
nrst = vuln_indices(ind); 

if d<=spd & ~isempty(nrst)  % if there is at least one  vulnerable within the search radius
    
    if length(nrst) > 1  % if more than one vulnerable located at same distance then randomly pick one
        s = round(rand*(length(nrst)-1))+1;
        nrst = nrst(s);
    end
    
    pk = 1-(d/spd);  % probability that infected will infect vulnerable is ratio of speed to distance
    
    if pk > rand
        IT_STATS.infections(STEP_NUM+1) = IT_STATS.infections(STEP_NUM+1)+1;  % update model statistics
        MESSAGES.new_infec(nrst) = true;  % send message to vaccinated so it knows it's infected!
    end
end