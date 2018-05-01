function [agt,eaten]=eat(agt,cn)

% vaccinated people don't eat...

global  ENV_DATA 

eaten=0;   %flag tells vaccinated to migrate