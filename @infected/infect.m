function infect(agt, i)

% infect function for class INFECTED
% agt = infected agent
% i = agent index

global  MESSAGES PARAM

pos = agt.pos;              % current agent position
spd = PARAM.INFEC_SPEED;    % speed of agent

% calculate indices, positions and distances of susc agents
susc_indices = find(MESSAGES.atype == 1 | MESSAGES.atype == 2);  
susc_pos = MESSAGES.pos(susc_indices,:);   
distances = sqrt((susc_pos(:,1)-pos(:,1)).^2+(susc_pos(:,2)-pos(:,2)).^2);
[dist, ind] = min(distances);   % find the smallest distance, dist = distance, ind = index of nearest agent
nrst = susc_indices(ind);       % nearest agent object

if dist<=spd & ~isempty(nrst)
    
    % if two agents are the same distance, choose one
    if length(nrst) > 1
        s = round(rand*(length(nrst)-1))+1;
        nrst = nrst(s);
    end
    
    % if the agent is closer than a random distance, infect them
    if  dist < rand && MESSAGES.atype(nrst) == 1
        % don't create new infected agent immediately, just send a message
        MESSAGES.new_infec(nrst) = true;
        
        % Add value to matrix for calculating r_zero
        if length(MESSAGES.infections_passed) > i
            MESSAGES.infections_passed(i) = MESSAGES.infections_passed(i) + 1;
        else
            MESSAGES.infections_passed(i) = 0;
        end
    end
end