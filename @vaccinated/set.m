function c = set(c, prop_name, val)

switch prop_name    
    case 'age'
        c.age=val;
    case 'health'
        c.health=val;
    case 'pos'
        c.pos=val;
    otherwise
        error('invalid field name')
end

