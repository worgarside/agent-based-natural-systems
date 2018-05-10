function create_params

global PARAM

% ========== Vulnerable ========== %

PARAM.VULN_SPEED = 1;               % Speed of vulnerable
PARAM.VULN_MAX_AGE = 70;            % Maximum age of vulnerable agent
PARAM.VULN_BREED_FREQ = 30;         % Iterations between offspring generation
PARAM.VULN_BREED_CHANCE = 0.075;      % Chance of vulnerable breeding
PARAM.VULN_VACCINE_AGE = 18;        % age at which vulnerable become vaccinated
PARAM.VULN_VACCINATE_CHANCE = 0.05;  % chance of vulnerable getting vaccinated

% ========== Vaccinated ========== %

PARAM.VACC_SPEED = 1;               % Speed of vaccinated
PARAM.VACC_MAX_AGE = 100;            % Maximum age of vaccinated agent
PARAM.VACC_BREED_FREQ = 50;         % Iterations between offspring generation
PARAM.VACC_BREED_CHANCE = 0.075;      % Chance of vaccinated breeding

% ========== Infected ========== %

PARAM.INFEC_SPEED = 1;              % Speed of infected
PARAM.INFEC_LIFE = 10;              % Number of steps for death chance to be active
PARAM.INFEC_DEATH_CHANCE = 0.025;	% Chance of dying per step after INFEC_LIFE
PARAM.INFEC_MAX_AGE = 40;           % Maximum age of infected agent
PARAM.INFEC_BREED_FREQ = 30;        % Iterations between offspring generation
PARAM.INFEC_BREED_CHANCE = 0.03;    % Chance of infected breeding
PARAM.INFEC_HEAL_TIME = 10;         % Number of steps for heal chance to be active
PARAM.INFEC_HEAL_CHANCE = 0.025;     % Chance of healing per step after INFEC_HEAL_TIME
PARAM.INFECTION_CHANCE = 0.75;