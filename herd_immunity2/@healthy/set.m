function c=set(c,prop_name,val)

%standard function to allow insertion of memory parameters from healthy human

switch prop_name
             
case 'vaccinated'
   c.vaccinated=val;
case 'health'
    c.health=val; 
case 'immune'
   c.immune=val;
case 'carrier'
   c.carrier=val; 
case 'pos'
   c.pos=val; 
otherwise 
   error('invalid field name')
end

