function [r_zero] = calc_r_zero()

global MESSAGES;

infecters = 0;
total_infec_count = 0;
for j = 1:length(MESSAGES.infections_passed)
    total_infec_count = total_infec_count + MESSAGES.infections_passed(j);
    if  MESSAGES.infections_passed(j) > 0
        infecters = infecters +1;
    end
end
r_zero = total_infec_count / infecters;

end

