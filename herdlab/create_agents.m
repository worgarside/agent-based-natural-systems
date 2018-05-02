function [agent]=create_agents(vacc_count,infec_count)

global ENV_DATA MESSAGES PARAM

size=ENV_DATA.size;
vacc_loc=(size-1)*rand(vacc_count,2)+1;      %generate random initial positions for vaccinateds
infec_loc=(size-1)*rand(infec_count,2)+1;      %generate random initial positions for infectedes

MESSAGES.pos=[vacc_loc;infec_loc];

for vacc=1:vacc_count
    pos = vacc_loc(vacc,:);
    age = ceil(rand*10);
    health = 100;
    immune = true;
    
    agent{vacc} = vaccinated(age, health, immune, PARAM.VACC_SPEED, pos);
end

for infec = vacc_count+1:vacc_count+infec_count
    pos=infec_loc(infec-vacc_count,:);
    
    age=ceil(rand*10);
    health=50;
    agent{infec}=infected(age,health,pos);
end
