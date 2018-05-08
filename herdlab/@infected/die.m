function [agt, klld] = die(agt, cn)

global PARAM STEP_NUM MESSAGES

klld = false;

infection_age = STEP_NUM - agt.infection_step;

if infection_age > PARAM.INFEC_LIFE
    klld = true;
    MESSAGES.dead(cn) = true;
end
