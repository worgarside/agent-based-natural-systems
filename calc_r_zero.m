function [r_zero] = calc_r_zero()
% Calculates the reproduction number of the disease in the simulation

global MESSAGES;

infecters = 0;          % number of agents who have passed on an infection
total_infec_count = 0;  % number of infect functions run

for i = 1:length(MESSAGES.infections_passed)
    total_infec_count = total_infec_count + MESSAGES.infections_passed(i);
    
    % if they have passed at least one infection, they are an infecter
    if  MESSAGES.infections_passed(i) > 0
        infecters = infecters + 1;
    end
end
% return avergae number of infections passed
r_zero = total_infec_count / infecters;

end

