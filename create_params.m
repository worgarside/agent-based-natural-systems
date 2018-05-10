function create_params

global PARAM

% ========== Vulnerable ========== %

PARAM.VULN_SPEED = 1;               % Speed of vulnerable
PARAM.VULN_MAX_AGE = 85;            % Maximum age of vulnerable agent
PARAM.VULN_BREED_FREQ = 30;         % Iterations between offspring generation
PARAM.VULN_BREED_CHANCE = 0.25;      % Chance of vulnerable breeding
PARAM.VULN_VACCINE_AGE = 14;        % age at which vulnerable become vaccinated
PARAM.VULN_VACCINATE_CHANCE = 0.2;  % chance of vulnerable getting vaccinated

% ========== Vaccinated ========== %

PARAM.VACC_SPEED = 1;               % Speed of vaccinated
PARAM.VACC_MAX_AGE = 85;            % Maximum age of vaccinated agent
PARAM.VACC_BREED_FREQ = 30;         % Iterations between offspring generation
PARAM.VACC_BREED_CHANCE = 0.25;      % Chance of vaccinated breeding

% ========== Infected ========== %

PARAM.INFEC_SPEED = 1;              % Speed of infected
PARAM.INFEC_DEATH_CHANCE = 0.1;	% Chance of dying per step after INFEC_LIFE
PARAM.INFEC_MAX_AGE = 40;           % Maximum age of infected agent
PARAM.INFEC_BREED_FREQ = 30;        % Iterations between offspring generation
PARAM.INFEC_BREED_CHANCE = 0.2;    % Chance of infected breeding
PARAM.INFEC_HEAL_CHANCE = 0.225;     % Chance of healing per step after INFEC_HEAL_TIME
PARAM.INFECTION_CHANCE = 1;

PARAM.INFEC_LIFE = 6;              % Number of steps for death chance to be active
PARAM.INFEC_HEAL_TIME = 3;         % Number of steps for heal chance to be active