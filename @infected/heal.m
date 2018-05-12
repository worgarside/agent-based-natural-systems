function heal(agt, i)


% healing function for class INFECTED
% agt = infected agent
% i = agent index

global PARAM MESSAGES

% random chance if the agent heals
if PARAM.INFEC_HEAL_CHANCE > (rand*1.5)
    % Don't immediately change the agent type, post a message to change it
    % at the end of the step
    MESSAGES.new_susc(i) = true;
end