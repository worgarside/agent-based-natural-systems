function heal(agt, cn)

global PARAM STEP_NUM MESSAGES

infection_age = STEP_NUM - agt.infection_step;

if (infection_age > PARAM.INFEC_HEAL_TIME && PARAM.INFEC_HEAL_CHANCE > rand)
    MESSAGES.new_vuln(cn) = true;
end