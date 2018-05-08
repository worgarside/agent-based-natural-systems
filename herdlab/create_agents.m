function [agent]=create_agents(vuln_count, vacc_count,infec_count)

global ENV_DATA MESSAGES

size = ENV_DATA.size;

% generate random initial positions
vuln_loc = (size-1)*rand(vuln_count, 2)+1;
vacc_loc = (size-1)*rand(vacc_count, 2)+1;
infec_loc = (size-1)*rand(infec_count, 2)+1;

MESSAGES.pos=[vuln_loc;vacc_loc;infec_loc];

for vuln = 1 : vuln_count
    age = ceil(rand*10);
    health = 100;
    pos = vuln_loc(vuln,:);
    carrier = false;
    immune = false;
    
    agent{vuln} = vulnerable(age, health, pos, carrier, immune);
end

for vacc = vuln_count+1 : vuln_count+vacc_count
    age = ceil(rand*10);
    health = 100;
    pos = vacc_loc(vacc-vuln_count,:);
    
    agent{vacc} = vaccinated(age, health, pos);
end

for infec = vuln_count+vacc_count+1 : vuln_count+vacc_count+infec_count    
    age = ceil(rand*10);
    health = 50;
    pos = infec_loc(infec-(vuln_count+vacc_count),:);
    
    agent{infec} = infected(age, health, pos, 0);
end
