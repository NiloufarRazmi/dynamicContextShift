
num        = 1;
wid        = 10; % total width
hts        = 5; % height of each row
cols       = {[0.75 0.75],[0.75 0.75 0.75]}; % width of columns
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
    boundedline(shiftIncs(1:50),mean(nonstableError(1:50,:),2),std(nonstableError(1:50,:),0,2),'--');
    errorbar(mean(contextShift(51,TAC==0)),mean(nonstableError(end-1,:),2),std(nonstableError(51,:),0,2),'.','MarkerSize',10)
    errorbar(mean(contextShift(52,TAC==0)),mean(nonstableError(end,:),2),std(nonstableError(52,:),0,2),'.','MarkerSize',10)
    ylabel('Error')
    xlabel('Average Context Shift')
    ylim([10 80])
    
    elseif xx==4
    hold on
    boundedline(shiftIncs(1:25),(stableError(1:25)),std(stableError(1:25,:),0,2),'--');
    errorbar(mean(contextShift(51,TAC>4)),stableError(end-1),std(stableError(51,:),0,2),'.','MarkerSize',10)
    errorbar(mean(contextShift(52,TAC>4)),stableError(end),std(stableError(52,:),0,2),'.','MarkerSize',10)
    ylabel('Error')
    xlabel('Average Context Shift')
    xlim([-0.05 1])

    elseif xx==5
       hold on
        boundedline(shiftIncs(1:25),mean(absNonCP_PE(1:25,:),2),std(absNonCP_PE(1:25,:),0,2),'--');
        errorbar(mean(contextShift(51,:)),mean(absNonCP_PE(end-1,:)),std(absNonCP_PE(51,:),0,2),'.','MarkerSize',10)
        errorbar(mean(contextShift(52,:)),mean(absNonCP_PE(end,:)),std(absNonCP_PE(52,:),0,2),'.','MarkerSize',10)
        ylabel('Error')
        xlabel('Average Context Shift')

    
    end
        setPLOT_panelLabel(gca, xx);

end

kk=annotation('textbox');
set(kk, 'string', ' Figure 3', 'position', [0.85 0.95 0.15 0.05], 'EdgeColor', 'none')

saveas(gcf,  'figure3.fig', 'fig')
saveas(gcf,  'figure3.eps', 'epsc2')
close(gcf)

