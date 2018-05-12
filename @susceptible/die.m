function [agt, klld] = die(agt, i)

% death function for class SUSCEPTIBLE
% agt = infected agent
% i = agent index
% klld = boolean flag if agent has died

global PARAM MESSAGES

klld = false;  % agent hasn't died yet

if agt.age > PARAM.SUSC_MAX_AGE
    % kill agent and send a message to kill agent off at the end of the step
    klld = true;
    MESSAGES.dead(i) = true;
end