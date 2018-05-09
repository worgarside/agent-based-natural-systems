function [agt] = migrate(agt)

global ENV_DATA PARAM

migrated = false;
pos = agt.pos;
spd = PARAM.VACC_SPEED;
size = ENV_DATA.size;

cnt = 0;
dir = rand*2*pi;
while ~migrated && cnt < 8
    npos(1) = pos(1) + spd*cos(dir);
    npos(2) = pos(2) + spd*sin(dir);
    if npos(1) < size && npos(2) < size && npos(1) >= 1 && npos(2) >= 1
        migrated = true;
    end
    cnt = cnt+1;
    dir = dir+(pi/4);
end

if migrated
    agt.pos = npos;
end