function create_params()

global PARAM

% ==================== Susceptible ==================== %

PARAM.SUSC_SPEED = 1;               % Speed of susceptible
PARAM.SUSC_MAX_AGE = 85;            % Maximum age of susceptible agent
PARAM.SUSC_BREED_FREQ = 20;         % Iterations between offspring generation
PARAM.SUSC_BREED_CHANCE = 0.5;      % Chance of susceptible breeding

% ==================== Vaccinated ==================== %

PARAM.VACC_SPEED = 1;               % Speed of vaccinated
PARAM.VACC_MAX_AGE = 85;            % Maximum age of vaccinated agent
PARAM.VACC_BREED_FREQ = 20;         % Iterations between offspring generation
PARAM.VACC_BREED_CHANCE = 0.5;      % Chance of vaccinated breeding

% ==================== Infected ==================== %

PARAM.INFEC_SPEED = 1;              % Speed of infected
PARAM.INFEC_MAX_AGE = 70;           % Maximum age of infected agent
PARAM.INFEC_BREED_FREQ = 20;        % Iterations between offspring generation
PARAM.INFEC_BREED_CHANCE = 0.25;    % Chance of infected breeding

PARAM.INFEC_DEATH_DELAY = 10;       % Minimum number of days infected survive
PARAM.INFEC_DEATH_CHANCE = 0.01;    % Chance of dying per step 
PARAM.INFEC_HEAL_CHANCE = 0.01;     % Chance of healing per step