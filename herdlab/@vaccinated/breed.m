function [agt, new]=breed(agt,cn)

%breeding function for class VACCINATED
%agt=vaccinated object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both foxes and vaccinateds

flim=PARAM.R_FOODBRD;       %minimum food level required for breeding
current_health=agt.health;              %get current agent food level
age=agt.age;                %get current agent age
pos=agt.pos;         %current position


% TODO: implement breeding


if current_health>=flim
    new=vaccinated(0, 100, false, false, pos, false);   %new vaccinated agent
    agt.age=age+1;
    IT_STATS.div_r(N_IT+1)=IT_STATS.div_r(N_IT+1)+1;             %update statistics
else
    agt.age=age+1;                          %not able to breed, so increment age by 1
    new=[];
end