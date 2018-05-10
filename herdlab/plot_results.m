function plot_results(agent, fast_mode, outImages)

global STEP_NUM IT_STATS ENV_DATA MESSAGES

vuln_count = IT_STATS.vulnerable;
vacc_count = IT_STATS.vaccinated;
healthy_count = vuln_count + vacc_count;
infec_count = IT_STATS.infected;
agent_count = IT_STATS.agt_count(STEP_NUM+1);

% fprintf('\nIteration #%i\n', STEP_NUM)
% fprintf('Migrations:      %i\n', IT_STATS.migrations(STEP_NUM))
% fprintf('Infections:      %i\n', IT_STATS.infections(STEP_NUM))
% fprintf('Vulnerable:      %i\n', IT_STATS.vulnerable(STEP_NUM))
% fprintf('Vaccinated:      %i\n', IT_STATS.vaccinated(STEP_NUM))
% fprintf('Infected:        %i\n', IT_STATS.infected(STEP_NUM))

f2=figure(2);
set(f2,'Units', 'Normalized');
set(f2,'Position', [0.5 0.05 0.5 0.9]);

xRange = 1.05*STEP_NUM;
yRange = 1.05*max(IT_STATS.agt_count);

plot(...
    (1:STEP_NUM+1), vuln_count(1:STEP_NUM+1), 'b-',...
    (1:STEP_NUM+1), vacc_count(1:STEP_NUM+1), 'g-',...
    (1:STEP_NUM+1), healthy_count(1:STEP_NUM+1), 'c-',...
    (1:STEP_NUM+1), infec_count(1:STEP_NUM+1), 'r-',...
    (1:STEP_NUM+1), IT_STATS.agt_count(1:STEP_NUM+1), 'k-')

axis([1 xRange 0 yRange]);
title('Agent Types');
legend('Vuln', 'Vacc', 'Health', 'Infec', 'Total');
xlabel('Steps')
ylabel('Number of agents')
drawnow

%create plot of agent locations.
f3 = figure(3);

size = ENV_DATA.size;
clf                             %clear previous plot
set(f3,'Units', 'Normalized');
set(f3,'Position', [0 0.05 0.5 0.9]);
v = (1:size);
[X,Y] = meshgrid(v);
Z = floor(50*ones(size,size));
H = zeros(size,size);
hs = surf(Y,X,H,Z);               %plot food distribution on plain background
cm = colormap('gray');
icm = flipud(cm);
colormap(icm);
set(hs, 'SpecularExponent', 1);       %sets up lighting
set(hs, 'SpecularStrength', 0.1);
hold on

for curr_agent = 1:length(agent)
    if MESSAGES.atype(curr_agent) > 0
        pos = get(agent{curr_agent}, 'pos');
        if isa(agent{curr_agent}, 'vulnerable')
            fo = plot(pos(1), pos(2), 'b.');
            set(fo,'MarkerSize', 20);
        elseif isa(agent{curr_agent}, 'vaccinated')
            fo = plot(pos(1), pos(2), 'g.');
            set(fo,'MarkerSize', 20);
        elseif isa(agent{curr_agent}, 'infected')
            fo = plot(pos(1), pos(2), 'r.');
            set(fo,'MarkerSize', 20);
        end
    end
end

h = findobj(gcf,'type', 'surface');
% set(h,'edgecolor', 'white');
set(h,'edgecolor', 'none');
lighting flat
axis equal

uicontrol(...
    'Style', 'pushbutton',...
    'String', 'PAUSE',...
    'Position', [20 20 60 20], ...
    'Callback', 'global ENV_DATA; ENV_DATA.pause=true; display(ENV_DATA.pause); clear ENV_DATA;');

title(['Iteration #' num2str(STEP_NUM) '    Total: ' num2str(agent_count) '    Vuln: ' num2str(vuln_count(STEP_NUM+1)) '    Vacc: ' num2str(vacc_count(STEP_NUM+1)) '    Infec: ' num2str(infec_count(STEP_NUM+1))]);
axis on
drawnow
if outImages==true  % this outputs images if outImage parameter set to true!!
    if fast_mode==true % this warning is to show not all iterations are being output if fmode=true!
        disp('WARNING*** fastmode set - To output all Images for a movie, set fmode to false(fast mode turned off) ');
    end
    filenamejpg = sprintf('%04d',STEP_NUM);
    eval(['print -djpeg90 agent_plot_' filenamejpg]); %print new jpeg to create movie later
end