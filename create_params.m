function create_params(lethality)

global PARAM

% ==================== Vulnerable ==================== %

PARAM.VULN_SPEED = 1;                           % Speed of vulnerable
PARAM.VULN_MAX_AGE = 85;                        % Maximum age of vulnerable agent
PARAM.VULN_BREED_FREQ = 20;                     % Iterations between offspring generation
PARAM.VULN_BREED_CHANCE = 0.5;                 % Chance of vulnerable breeding
PARAM.VULN_VACCINE_AGE = 16;                    % age at which vulnerable become vaccinated
PARAM.VULN_VACCINATE_CHANCE = 0.1;             % chance of vulnerable getting vaccinated

% ==================== Vaccinated ==================== %

PARAM.VACC_SPEED = 1;                           % Speed of vaccinated
PARAM.VACC_MAX_AGE = 85;                        % Maximum age of vaccinated agent
PARAM.VACC_BREED_FREQ = 20;                     % Iterations between offspring generation
PARAM.VACC_BREED_CHANCE = 0.5;                 % Chance of vaccinated breeding

% ==================== Infected ==================== %

PARAM.INFEC_SPEED = 1;  % Speed of infected
PARAM.INFEC_MAX_AGE = 85;                       % Maximum age of infected agent
PARAM.INFEC_BREED_FREQ = 20;                    % Iterations between offspring generation
PARAM.INFEC_BREED_CHANCE = 0.25;                     % Chance of infected breeding

PARAM.INFEC_DEATH_DELAY = 500;
PARAM.INFEC_DEATH_CHANCE = 0.9+(lethality/10)*0.25;      % Chance of dying per step 
PARAM.INFEC_HEAL_CHANCE = (lethality/10)*0.25;    % Chance of healing per step