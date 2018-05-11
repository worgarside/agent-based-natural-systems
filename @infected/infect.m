function infect(agt, i)

global  MESSAGES PARAM

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
    
    pk = 1-dist;
    
    if  pk > rand
        
        MESSAGES.new_infec(nrst) = true;
        if length(MESSAGES.infections_passed) > i
            MESSAGES.infections_passed(i) = MESSAGES.infections_passed(i) + 1;
        else
            MESSAGES.infections_passed(i) = 0;
        end
    end
end