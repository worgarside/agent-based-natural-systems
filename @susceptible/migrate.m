function [agt] = migrate(agt)

global ENV_DATA PARAM

migrated = false;           % migration flag
pos = agt.pos;              % agent position
spd = PARAM.SUSC_SPEED;     % agent speed
size = ENV_DATA.size;       % size of arena

migrate_count = 0;  % number of times the agent has tried to migrate
dir = rand*2*pi;    % random direction

while ~migrated && migrate_count < 8
    npos(1) = pos(1) + spd*cos(dir);
    npos(2) = pos(2) + spd*sin(dir);
    
    % if the agent isn't going to migrate out of the arena, break the loop
    if npos(1) < size && npos(2) < size && npos(1) >= 1 && npos(2) >= 1
        migrated = true;
    end
    migrate_count = migrate_count+1;
    dir = dir+(pi/4);
end

if migrated
    agt.pos = npos;
end