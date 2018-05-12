function plot_results(agent, susc_count, vacc_count, infec_count, r_zero, outImages)
global STEP_NUM IT_STATS ENV_DATA MESSAGES

susceptible = IT_STATS.susceptible;
vaccinated = IT_STATS.vaccinated;
infected = IT_STATS.infected;
curr_agent_count = IT_STATS.agt_count(STEP_NUM+1);

f2=figure(2);
set(f2,'Units', 'Normalized');
set(f2,'Position', [0.5 0.05 0.5 0.8]);

x_range = 1.05*STEP_NUM;    % x range is slightly larger than number of steps for readability
y_range = 1000;             % y range is set to hard value of 100 for comparibility

p = plot(...
    (1:STEP_NUM+1), susceptible(1:STEP_NUM+1), 'b-',...
    (1:STEP_NUM+1), vaccinated(1:STEP_NUM+1), 'g-',...
    (1:STEP_NUM+1), infected(1:STEP_NUM+1), 'r-',...
    (1:STEP_NUM+1), IT_STATS.agt_count(1:STEP_NUM+1), 'k-'...
    );

set(p,'linewidth',2);
axis([1 x_range 0 y_range]);
title([num2str(susc_count) ' / ' num2str(vacc_count) ' / ' num2str(infec_count) '   -   ' num2str(susceptible(STEP_NUM)) ' / ' num2str(vaccinated(STEP_NUM)) ' / ' num2str(infected(STEP_NUM))  '   -   R' num2str(r_zero) ]);

legend('Susc', 'Vacc', 'Infec', 'Total');
xlabel('Steps')
ylabel('Number of agents')
drawnow
if outImages
    filename = sprintf('%03i_%03i_%i', susc_count, vacc_count, infec_count);
    eval(['print -djpeg90 ' filename]);
end

% create plot of agent locations
f3 = figure(3);
size = ENV_DATA.size;
clf %clear previous plot
set(f3,'Units', 'Normalized');
set(f3,'Position', [0 0.05 0.5 0.8]);
v = (1:size);           
[X,Y] = meshgrid(v);    % create meshgrid of correct size
H = zeros(size,size);   % value of each grid point is 0
surf(Y,X,H);            % figure should be of type surf for 3D effect
colormap('gray');       % set color to gray
hold on

% plot each agent as a different color and at correct position
for curr_agent = 1:length(agent)
    if MESSAGES.atype(curr_agent) > 0
        pos = get(agent{curr_agent}, 'pos');
        if isa(agent{curr_agent}, 'susceptible')
            point = plot(pos(1), pos(2), 'b.');            
        elseif isa(agent{curr_agent}, 'vaccinated')
            point = plot(pos(1), pos(2), 'g.');        
        elseif isa(agent{curr_agent}, 'infected')
            point = plot(pos(1), pos(2), 'r.');            
        end
        set(point,'MarkerSize', 20);
    end
end

h = findobj(gcf,'type', 'surface');
set(h,'edgecolor', 'none');

title(['Iteration #' num2str(STEP_NUM) '    Total: ' num2str(curr_agent_count) '    Susc: ' num2str(susceptible(STEP_NUM+1)) '    Vacc: ' num2str(vaccinated(STEP_NUM+1)) '    Infec: ' num2str(infected(STEP_NUM+1))]);
axis off
drawnow