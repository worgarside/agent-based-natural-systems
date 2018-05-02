function val=get(c,prop_name)

switch prop_name    
    case 'age'
        val=c.age;
    case 'health'
        val=c.health;
    case 'pos'
        val=c.pos;
    otherwise
        error('Invalid field name')
end

