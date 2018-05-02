function [agt]=migrate(agt,cn)

global IT_STATS STEP_NUM ENV_DATA PARAM

size = ENV_DATA.size;
spd = PARAM.INFEC_SPEED;
pos = agt.pos;

migrated = false;
cnt = 1;
dir = rand*2*pi;
while ~migrated && cnt<=8
    npos(1) = pos(1) + spd*cos(dir);
    npos(2) = pos(2) + spd*sin(dir);
    if npos(1)<size && npos(2)<size && npos(1)>=1 && npos(2)>=1
        migrated = true;
    end
    cnt = cnt+1;
    dir = dir+(pi/4);         %if migration not successful, then increment direction by 45 degrees and try again
end

if migrated
    agt.pos = npos;                    %update agent memory
    IT_STATS.migrations(STEP_NUM+1) = IT_STATS.migrations(STEP_NUM+1) + 1;    %update model statistics
end




