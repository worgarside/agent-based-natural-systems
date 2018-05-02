function c = set(c, prop_name, val)

%standard function to allow insertion of memory parameters from rabbit object

switch prop_name    
    case 'age'
        c.age = val;
    case 'health'
        c.health = val;
    case 'pos'
        c.pos = val;
    case 'carrier'
        c.carrier = val;
    case 'immune'
        c.immune = val;
    otherwise
        error('invalid field name')
end

