function [new_agents] = agnt_solve(agent)

% sequence of functions called to apply agent rules to current agent population.
% agent = matrix of agent objects
% new_agents = updated agent matrix for the next step

agent_count = length(agent);    % current no. of agents
new_agent_count = 0;            % initialise counter

% execute existing agent update loop
for i = 1:agent_count
    curr_agent = agent{i};
    
    if isa(curr_agent,'infected') || isa(curr_agent,'vaccinated') || isa(curr_agent,'susceptible')
        % check if the agent will die before further processing
        [curr_agent, klld] = die(curr_agent, i);
        
        if ~klld
            if isa(curr_agent, 'infected')
                infect(curr_agent, i);  % if current agent is infected, infect others around them
                heal(curr_agent, i)     % also try to heal them
            end
            
            % all agents can breed, so see if they do
            [curr_agent, new] = breed(curr_agent);
            
            % if there is a new offspring, process them and add them to the
            % matrix
            if ~isempty(new)
                new_agent_count = new_agent_count + 1;
                agent{agent_count + new_agent_count} = new;
            end
            
            curr_agent = migrate(curr_agent);       % migrate regardless of infection
            curr_agent.age = curr_agent.age + 1;    % increment the agent's age
        end
        agent{i} = curr_agent;  % update cell array with modified agent data structure
    end
end
total_count = agent_count + new_agent_count;
[new_agents] = update_messages(agent, agent_count, total_count);   %function which update message list and 'kills off' dead agents.

