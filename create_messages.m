function create_messages(agent)

% populates global message boards for passing information between agents
% and functions

global MESSAGES

for i = 1:length(agent)
    if isa(agent{i},'susceptible')
        MESSAGES.atype(i) = 1;
    elseif isa(agent{i},'vaccinated')
        MESSAGES.atype(i) = 2;
    elseif isa(agent{i}, 'infected')
        MESSAGES.atype(i) = 3;
    end

    MESSAGES.new_infec(i) = false;  % flag for transforming to infected agent
    MESSAGES.new_vacc(i) = false;   % flag for transforming to vacicnated agent
    MESSAGES.new_susc(i) = false;   % flag for transforming to susceptible agent
    MESSAGES.dead(i) = false;       % flag for removing agent from simulation
    MESSAGES.infections_passed(i) = 0;   % matrix for storing the number of agents infected by each agent
    % infections_passed is a simulation-wide global variable, rather than
    % local to each step, which is why it's in MESSAGES and not IT_STATS
end