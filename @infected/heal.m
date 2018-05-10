function heal(agt, cn)

global PARAM MESSAGES

if PARAM.INFEC_HEAL_CHANCE > (rand*1.5)
    MESSAGES.new_vuln(cn) = true;
end