function [agt, klld] = die(agt, i)

% death function for class INFECTED
% agt = infected agent
% i = agent index
% klld = boolean flag if agent has died

global PARAM STEP_NUM MESSAGES

klld = false;  % agent hasn't died yet
infection_age = STEP_NUM - agt.infection_step; % calculate how long the agent has been infected

if (infection_age > PARAM.INFEC_DEATH_DELAY && PARAM.INFEC_DEATH_CHANCE > rand) || agt.age > PARAM.INFEC_MAX_AGE
    % kill agent and send a message to kill agent off at the end of the step
    klld = true;
    MESSAGES.dead(i) = true;
end