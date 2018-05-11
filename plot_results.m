function plot_results(agent, vuln_count, vacc_count, infec_count, lethality, outImages)
global STEP_NUM IT_STATS ENV_DATA MESSAGES

curr_vuln_count = IT_STATS.vulnerable;
curr_vacc_count = IT_STATS.vaccinated;
curr_healthy_count = curr_vuln_count + curr_vacc_count;
curr_infec_count = IT_STATS.infected;
curr_agent_count = IT_STATS.agt_count(STEP_NUM+1);

f2=figure(2);
set(f2,'Units', 'Normalized');
set(f2,'Position', [0.5 0.05 0.5 0.8]);

x_range = 1.05*STEP_NUM;
y_range = 1.05*max(IT_STATS.agt_count);
y_range = 10000;

plot(...
    (1:STEP_NUM+1), curr_vuln_count(1:STEP_NUM+1), 'b-',...
    (1:STEP_NUM+1), curr_vacc_count(1:STEP_NUM+1), 'g-',...
    (1:STEP_NUM+1), curr_healthy_count(1:STEP_NUM+1), 'c-',...
    (1:STEP_NUM+1), curr_infec_count(1:STEP_NUM+1), 'r-',...
    (1:STEP_NUM+1), IT_STATS.agt_count(1:STEP_NUM+1), 'k-'...
    )

axis([1 x_range 0 y_range]);
title([num2str(vuln_count) ' / ' num2str(vacc_count) ' / ' num2str(infec_count) '  -  L' num2str(lethality) '  -  ' num2str(curr_vuln_count(STEP_NUM)) ' / ' num2str(curr_vacc_count(STEP_NUM)) ' / ' num2str(curr_infec_count(STEP_NUM))]);

legend('Vuln', 'Vacc', 'Non-infec', 'Infec', 'Total');
xlabel('Steps')
ylabel('Number of agents')
drawnow
if outImages
    filename = sprintf('%03i_%03i_%i-L%i', vuln_count, vacc_count, infec_count, lethality*100);
    eval(['print -djpeg90 ' filename]);
end

%
% %create plot of agent locations.
% f3 = figure(3);
%
% size = ENV_DATA.size;
% clf                             %clear previous plot
% set(f3,'Units', 'Normalized');
% set(f3,'Position', [0 0.05 0.5 0.8]);
% v = (1:size);
% [X,Y] = meshgrid(v);
% Z = floor(50*ones(size,size));
% H = zeros(size,size);
% hs = surf(Y,X,H,Z);               %plot food distribution on plain background
% cm = colormap('gray');
% icm = flipud(cm);
% colormap(icm);
% set(hs, 'SpecularExponent', 1);       %sets up lighting
% set(hs, 'SpecularStrength', 0.1);
% hold on
%
% for curr_agent = 1:length(agent)
%     if MESSAGES.atype(curr_agent) > 0
%         pos = get(agent{curr_agent}, 'pos');
%         if isa(agent{curr_agent}, 'vulnerable')
%             fo = plot(pos(1), pos(2), 'b.');
%             set(fo,'MarkerSize', 20);
%         elseif isa(agent{curr_agent}, 'vaccinated')
%             fo = plot(pos(1), pos(2), 'g.');
%             set(fo,'MarkerSize', 20);
%         elseif isa(agent{curr_agent}, 'infected')
%             fo = plot(pos(1), pos(2), 'r.');
%             set(fo,'MarkerSize', 20);
%         end
%     end
% end
%
% h = findobj(gcf,'type', 'surface');
% set(h,'edgecolor', 'none');
% lighting flat
% axis equal
%
% uicontrol(...
%     'Style', 'pushbutton',...
%     'String', 'PAUSE',...
%     'Position', [20 20 60 20], ...
%     'Callback', 'global ENV_DATA; ENV_DATA.pause=true; display(ENV_DATA.pause); clear ENV_DATA;');
%
% title(['Iteration #' num2str(STEP_NUM) '    Total: ' num2str(curr_agent_count) '    Vuln: ' num2str(curr_vuln_count(STEP_NUM+1)) '    Vacc: ' num2str(curr_vacc_count(STEP_NUM+1)) '    Infec: ' num2str(curr_infec_count(STEP_NUM+1))]);
% axis off
% drawnow