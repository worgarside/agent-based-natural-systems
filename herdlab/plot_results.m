function plot_results(agent, nsteps, fmode, outImages)

% Plots 2d patch images of agents onto background
%%%%%%%%%%%
% plot_results(agent,vacc_count,inf_count)
%%%%%%%%%%%
% agent - current list of agent structures
% vacc_count -  no. vaccinated
% inf_count -  no. infected

global STEP_NUM IT_STATS ENV_DATA MESSAGES CONTROL_DATA

% write results to the screen
vacc_count = IT_STATS.vaccinated;
inf_count = IT_STATS.infected;
fprintf('\nIteration #%i\n', STEP_NUM)
fprintf('Migrations:      %i\n', IT_STATS.migrations(STEP_NUM+1))
fprintf('Infected deaths: %i\n', IT_STATS.dead_infected(STEP_NUM+1))
fprintf('Infections:      %i\n', IT_STATS.infections(STEP_NUM+1))

%plot line graphs of agent numbers and remaining food
if (fmode==false) || (STEP_NUM==nsteps) || ((fmode==true) && (rem(STEP_NUM , CONTROL_DATA.fmode_display_every)==0))
    
    %Plotting takes time so fmode has been introduced to only plot every n=CONTROL_DATA.fmode_display_every iterations
    %This value increases with the number of agents (see ecolab.m L57-61) as plotting more agents takes longer.
    %fmode can be turned off in the command line - see ecolab documentation
    
    col{1}='g-';                   %set up colours that will represent different cell types red for vaccinated, blue for infected
    col{2}='r-';
    col{3}='b-';
    
    n = vacc_count(STEP_NUM+1)+inf_count(STEP_NUM+1);             %current agent number
    f2=figure(2);
    set(f2,'Units', 'Normalized');
    set(f2,'Position', [0.5 0.5 0.45 0.4]);
    
    subplot(3,1,1), cla
    subplot(3,1,1), plot((1:STEP_NUM+1), vacc_count(1:STEP_NUM+1), col{1});
    subplot(3,1,1), axis([0 nsteps 0 1.1*max(vacc_count)]);
    subplot(3,1,2), cla
    subplot(3,1,2), plot((1:STEP_NUM+1), inf_count(1:STEP_NUM+1), col{2});
    subplot(3,1,2), axis([0 nsteps 0 1.1*max(inf_count)]);
    subplot(3,1,3), cla
    subplot(3,1,3), plot((1:STEP_NUM+1), 1, 'm-');
    subplot(3,1,3), axis([0 nsteps 0 1]);
    subplot(3,1,1), title('Vaccinated');
    subplot(3,1,2), title('Infected');
    subplot(3,1,3), title('Natural');
    drawnow
    
    %create plot of agent locations.
    f3 = figure(3);
    
    size = ENV_DATA.size;
    typ=MESSAGES.atype;
    clf                             %clear previous plot
    set(f3,'Units','Normalized');
    set(f3,'Position',[0.05 0.05 0.66 0.66]);
    v=(1:size);
    [X,Y]=meshgrid(v);
    Z=floor(50*ones(size,size));
    H=zeros(size,size);
    hs=surf(Y,X,H,Z);               %plot food distribution on plain background
    cm=colormap('gray');
    icm=flipud(cm);
    colormap(icm);
    set(hs,'SpecularExponent',1);       %sets up lighting
    set(hs,'SpecularStrength',0.1);
    hold on
    
    for curr_agent = 1:length(agent)                  % cycle through each agent in turn
        if typ(curr_agent) > 0                      % only plot live agents
            pos = get(agent{curr_agent}, 'pos');      % extract current position
            % choose plot colour depending on agent type
            if isa(agent{curr_agent}, 'vaccinated')
                fo = plot(pos(1), pos(2), 'g*');
                set(fo,'MarkerSize', 20);
            elseif isa(agent{curr_agent}, 'infected')
                fo = plot(pos(1), pos(2), 'r.');
                set(fo,'MarkerSize', 20);
            else
                fo = plot(pos(1), pos(2), 'b+');
                set(fo,'MarkerSize', 30);
            end
        end
    end
    
    % Once all cells are plotted, set up perspective, lighting etc.
    h = findobj(gcf,'type', 'surface');
    set(h,'edgecolor', 'white');
    lighting flat
    axis equal
    
    uicontrol('Style', 'pushbutton',...
        'String', 'PAUSE',...
        'Position', [20 20 60 20], ...
        'Callback', 'global ENV_DATA; ENV_DATA.pause=true; display(ENV_DATA.pause); clear ENV_DATA;');
    
    title(['Iteration #' num2str(STEP_NUM) '     Agent Count: ' num2str(n)]);
    axis off
    drawnow
    if outImages==true  %this outputs images if outImage parameter set to true!!
        if fmode==true %this warning is to show not all iterations are being output if fmode=true!
            disp('WARNING*** fastmode set - To output all Images for a movie, set fmode to false(fast mode turned off) ');
        end
        filenamejpg = sprintf('%04d',STEP_NUM);
        eval(['print -djpeg90 agent_plot_' filenamejpg]); %print new jpeg to create movie later
    end
end
end
