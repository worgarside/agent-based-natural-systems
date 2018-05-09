function [nagent]=agnt_solve(agent)

agent_count = length(agent);    %current no. of agents


%execute existing agent update loop
for agt_num = 1:agent_count
    
    curr_agent = agent{agt_num};
    if isa(curr_agent,'infected')||isa(curr_agent,'vaccinated')||isa(curr_agent,'vulnerable')

        [curr_agent, klld] = die(curr_agent, agt_num);
%         klld = false;
        
        if ~klld
            if isa(curr_agent, 'infected')
                infect(curr_agent);  % if current agent is infected, infect others around them
            end
            curr_agent = migrate(curr_agent);  % migrate regardless of infection
            age = curr_agent.age;
            curr_agent.age = age + 1;
        end
        agent{agt_num} = curr_agent;  % update cell array with modified agent data structure
    end
end

[nagent] = update_messages(agent, agent_count);   %function which update message list and 'kills off' dead agents.

