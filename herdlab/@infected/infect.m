function infect(agt)

global  IT_STATS STEP_NUM MESSAGES PARAM

pos = agt.pos;
spd = PARAM.INFEC_SPEED;

vuln_indices = find(MESSAGES.atype == 1);
vuln_pos = MESSAGES.pos(vuln_indices,:);
distances = sqrt((vuln_pos(:,1)-pos(:,1)).^2+(vuln_pos(:,2)-pos(:,2)).^2);
[dist, ind] = min(distances);
nrst = vuln_indices(ind);

if dist<=spd & ~isempty(nrst)
    
    if length(nrst) > 1
        s = round(rand*(length(nrst)-1))+1;
        nrst = nrst(s);
    end
    
    pk = 1-(dist/spd);
    
    if pk > rand
        IT_STATS.infections(STEP_NUM+1) = IT_STATS.infections(STEP_NUM+1)+1;
        MESSAGES.new_infec(nrst) = true;
    end
end