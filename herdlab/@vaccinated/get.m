function val=get(c,prop_name)

switch prop_name    
    case 'age'
        val = c.age;
    case 'pos'
        val = c.pos;
    case 'last_breed'
        val = c.last_breed;
    otherwise
        error('Invalid field name')
end

