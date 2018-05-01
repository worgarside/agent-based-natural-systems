function val=get(c,prop_name)

%standard function to allow extraction of memory parameters from healthy human

switch prop_name
    
    case 'vaccinated'
        val=c.vaccinated;
    case 'health'
        val=c.health;
    case 'immune'
        val=c.immune;
    case 'carrier'
        val=c.carrier;
    case 'pos'
        val=c.pos;
    otherwise
        error('invalid field name')
end