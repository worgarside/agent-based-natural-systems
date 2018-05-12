function val = get(agt, prop)

% standard function to allow extraction of memory parameters from infected object
% agt = current agent
% prop = attribute to be retrieved

switch prop    
    case 'age'
        val = agt.age;
    case 'pos'
        val = agt.pos;
    case 'infection_step'
        val = agt.infection_step;
    case 'last_breed'
        val = agt.last_breed;
    otherwise
        error('invalid field name')
end

