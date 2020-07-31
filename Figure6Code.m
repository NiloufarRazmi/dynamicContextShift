
%% ------------------------------------------------------------------------
num        = 1;
wid        = 17; % total width
hts        = 5; % height of each row
cols       = {[0.7, .3],[.3, .3]}; % width of columns MRN changed.
[axs,fig_] = getPLOT_axes(num, wid, hts, cols, 2, 2, [], 'Razmi et al');
set(axs,'Units','normalized');
lw         =1.5;
lw2        =3;
exSub      =20;
%% ------------------------------------------------------------------------

for xx = 1:length(axs)
    axes(axs(xx)); hold on; cla(gca)
    if xx==1
        hold on
        plot(outcome(1:60), 'or', 'markerFaceColor',[0.8 0.8 0.8], 'markerEdgeColor', 'k', 'lineWidth', 1, 'markerSize', 8)
        plot(allEstimate(53,1:60),'lineWidth',2)
        plot(allEstimate(54,1:60),'lineWidth',2)
        plot(allEstimate(52,1:60),'lineWidth',2)
        
        odd=find(TAC==0);
        hold on
        for i=1:7
            plot([(odd(i)) (odd(i))] ,[0 300],'--k')
        end
        hold off
        
        ylabel('Position')
        xlabel('Trial')
        title('Dynamic Context Shifts')
        
    elseif xx==2
        hold on
        boundedline(shiftIncs(1:25),mean(absNonCP_PE(1:25,:),2),std(absNonCP_PE(1:25,:),0,2),'--');
        errorbar(mean(groundTruthContext),mean(absNonCP_PE(end-3,:)),std(absNonCP_PE(51,:),0,2),'.','MarkerSize',25)
        errorbar(mean(contextShift(52,:)),mean(absNonCP_PE(end-1,:)),std(absNonCP_PE(52,:),0,2),'.','MarkerSize',25)
        errorbar(mean(contextShift(53,:)),mean(absNonCP_PE(end-2,:)),std(absNonCP_PE(53,:),0,2),'.','MarkerSize',25)
        errorbar(mean(contextShift(54,:)),mean(absNonCP_PE(end,:)),std(absNonCP_PE(54,:),0,2),'.','MarkerSize',25)
        ylabel('Error')
        xlabel('Average Context Shift')
        legend('standard deviation','Fixed context shift','Ground Truth Model','dynamic latent states','dynamic learning rate','dynamic changepoint')

               
    elseif xx==3
        
        hold on
        boundedline(1:4,mean(contextShiftLRCP),std(contextShiftLRCP)/sqrt(numReps),'--');
        boundedline(1:4,mean(contextShiftLROB),std(contextShiftLROB)/sqrt(numReps),'--');
        ylabel('Empirical Learning Rate')
        xlabel('Learning Rate')
        xticks(1:4)
        xticklabels({'0-0.25','0.25-0.50','0.50-0.75','0.75-2'})
        legend('ChangePoint condition','OddBall Condition');
        
    elseif xx==4
        set(gca,'XColor', 'none','YColor','none')
        
        
    end
    setPLOT_panelLabel(gca,xx);
end
%% ------------------------------------------------------------------------

kk=annotation('textbox');
set(kk, 'string', ' Figure 6', 'position', [0.85 0.95 0.15 0.05], 'EdgeColor', 'none')
saveas(gcf,  'figure6.fig', 'fig')
saveas(gcf,  'figure6.eps', 'epsc2')
close(gcf)
