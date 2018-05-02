function val = get(c,prop_name)

%standard function to allow extraction of memory parameters from vaccinated object

switch prop_name
    
    case 'age'
        val=c.age;
    case 'health'
        val=c.health;
    case 'pos'
        val=c.pos;
    case 'carrier'
        val=c.carrier;
    case 'immune'
        val=c.immune;
    otherwise
        error('invalid field name')
end

