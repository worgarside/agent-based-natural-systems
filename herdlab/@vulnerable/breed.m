function [agt,new] = breed(agt)

global PARAM

last_breed = agt.last_breed;
pos = agt.pos;

if last_breed >= PARAM.VULN_BREED_FREQ && PARAM.VULN_BREED_CHANCE > rand
    age = 0;
    last_breed = 0;
    
    new = vulnerable(age, pos, last_breed);
    agt.last_breed = 0;
else
    agt.last_breed = last_breed + 1;
    new = [];
end