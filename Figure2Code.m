
num        = 1;
wid        = 10; % total width
hts        = 5; % height of each row
cols       = {[0.75 0.75],[0.75 0.75]}; % width of columns
[axs,fig_] = getPLOT_axes(num, wid, hts, cols, 3, 3, [], 'Razmi et al'); % etc
set(axs,'Units','normalized');
% draw in each panel, one at a time


lw=1.5;
lw2=3;
exSub=20;


for xx = 1:length(axs)
    axes(axs(xx)); hold on; cla(gca)
    
    if xx==1
        set(gca,'XColor', 'none','YColor','none')
        
        
        
    elseif xx==2
        set(gca,'XColor', 'none','YColor','none')
        
    elseif xx==3
        hold on
        plot(shiftIncs(1:25),bLearningRate(1:25),'k','LineWidth',3);
        errorbar(mean(contextShift(51,TAC>0)),bLearningRate(end-1),std(bLearningRate(51,:),0,2),'.','MarkerSize',25)
        errorbar(mean(contextShift(52,TAC>0)),bLearningRate(end),std(bLearningRate(52,:),0,2),'.','MarkerSize',25)
        legend('Fixed context shift','Ground Truth model','Dynamic context shift model')
        ylabel('Learning Rate')
        xlabel('Average Context Shift')
        xlim([-0.05 1])
    elseif xx==4
        hold on
        plot(shiftIncs(1:25),mean(absNonCP_PE(1:25,:),2),'k','LineWidth',3);
        ylabel('Error')
        xlabel('Average Context Shift')
        
        
    end
    setPLOT_panelLabel(gca, xx);
    
end

kk=annotation('textbox');
set(kk, 'string', ' Figure 2', 'position', [0.85 0.95 0.15 0.05], 'EdgeColor', 'none')

saveas(gcf,  'figure2.fig', 'fig')
saveas(gcf,  'figure2.eps', 'epsc2')
close(gcf)

