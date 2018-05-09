function [agt, klld] = die(agt, cn)

global PARAM MESSAGES

klld = false;

if agt.age > PARAM.VULN_MAX_AGE
    klld = true;
    MESSAGES.dead(cn) = true;
end