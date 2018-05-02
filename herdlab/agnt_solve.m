function [nagent,nn]=agnt_solve(agent)

agent_count = length(agent);    %current no. of agents
new_count = 0;    %no. new agents
prev_n = agent_count;   %remember current agent number at the start of this iteration

%execute existing agent update loop
for agt_count = 1:agent_count
    curr_agent = agent{agt_count};
    if isa(curr_agent, 'vaccinated')
        curr_agent = migrate(curr_agent,agt_count);
        
        agent{agt_count} = curr_agent;                          %up date cell array with modified agent data structure
    end
    
    if isa(curr_agent, 'infected')
        [curr_agent, new]=infect(curr_agent,agt_count);               %eating rules (rabbits eat food, foxes eat rabbits)
        
        curr_agent = migrate(curr_agent,agt_count);              %migrate regardless of infection
        
        if ~isempty(new)					%if current agent has bred during this iteration
            new_count=new_count+1;                 %increase new agent number
            agent{agent_count+new_count}=new;			%add new to end of agent list
        end
        
        agent{agt_count}=curr_agent;                          %up date cell array with modified agent data structure
    end
end

temp_n=agent_count+new_count; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.

