function agt = set(agt, prop, val)

% standard function to allow insertion of memory parameters
% agt = current agent
% prop = property to be set
% value = value to be added to property

switch prop    
    case 'pos'
        agt.pos = val;
    case 'age'
        agt.age = val;
    case 'last_breed'
        agt.last_breed = val;
    otherwise
        error('invalid field name')
end

