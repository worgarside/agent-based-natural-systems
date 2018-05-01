function [agt, new]=infect(agt,cn)

%eating function for class INFECTED
%agt=fox object
%cn - current agent number
%eaten = 1 if fox successfully finds a vaccinated, =0 otherwise

%SUMMARY OF INFECTED EAT RULE
%Fox calculates distance to all vaccinateds
%Fox identifies nearest vaccinateds(s)
%If more than one equidistant within search radius, one is randomly picked
%Probability of infected killing vaccinated =1 - distance of vaccinated/speed of infected
%If probability > rand, infected moves to vaccinated location and vaccinated is
%killed
%If infected does not kill vaccinated, it's food is decremented by one unit

%GLOBAL VARIABLES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%    MESSAGES.atype - n x 1 array listing the type of each agent in the model
%    (1=vaccinated, 2-infected, 3=dead agent)
%    MESSAGES.pos - list of every agent position in [x y]
%    MESSAGE.dead - n x1 array containing ones for agents that have died
%    in the current iteration

global  IT_STATS N_IT MESSAGES

pos=agt.pos;                        %extract current position
cfood=agt.health;                     %get current agent food level
spd=2;                      %infected migration speed in units per iteration - this is equal to the food search radius

typ=MESSAGES.atype;                                         %extract types of all agents
rb=find(typ==1);                                            %indices of all vaccinateds
rpos=MESSAGES.pos(rb,:);                                     %extract positions of all vaccinated
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all vaccinated
[d,ind]=min(csep);                                            %d is distance to closest vaccinated, ind is index of that vaccinated
nrst=rb(ind);                                                %index of nearest vaccinated(s)
new = [];
if d<=spd & length(nrst)>0    %if there is at least one  vaccinated within the search radius
    if length(nrst)>1       %if more than one vaccinated located at same distance then randomly pick one to head towards
        s=round(rand*(length(nrst)-1))+1;
        nrst=nrst(s);
    end
    pk=1-(d/spd);   %probability that infected will infect vaccinated is ratio of speed to distance
    if pk>rand
        nx=MESSAGES.pos(nrst,1);    %extract exact location of this vaccinated
        ny=MESSAGES.pos(nrst,2);
        npos=[nx ny];
        
        
        new=infected(MESSAGES.age(nrst), 50, npos);              

%         IT_STATS.eaten(N_IT+1)=IT_STATS.eaten(N_IT+1)+1;                %update model statistics
        MESSAGES.dead(nrst)=1;       % send message to vaccinated so it knows it's infected!
    end
end

% agt.health=cfood-1;     %reduce agent health by one unit




