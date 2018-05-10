function vaccinate(agt, cn)

global PARAM MESSAGES

if agt.age > PARAM.VULN_VACCINE_AGE && PARAM.VULN_VACCINATE_CHANCE > rand
    MESSAGES.new_vacc(cn) = true;
end