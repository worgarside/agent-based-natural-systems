function [nagent]=agnt_solve(agent)

agent_count = length(agent);    %current no. of agents

%execute existing agent update loop
for agt_count = 1:agent_count
    curr_agent = agent{agt_count};
    
    %     if isa(curr_agent, 'vaccinated') || isa(curr_agent, 'vulnerable')
    %         curr_agent = migrate(curr_agent,agt_count);
    %         agent{agt_count} = curr_agent; % update cell array with modified agent data structure
    %     end
    
    if isa(curr_agent, 'infected')
        infect(curr_agent);  % if current agent is infected, infect others around them
    end
    curr_agent = migrate(curr_agent,agt_count);  % migrate regardless of infection
    agent{agt_count}=curr_agent;  % update cell array with modified agent data structure
    %     end
end


[nagent] = update_messages(agent, agent_count);   %function which update message list and 'kills off' dead agents.

