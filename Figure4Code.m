
num        = 1;
wid        = 10; % total width
hts        = 5; % height of each row
cols       = {[0.75 0.75],[0.75 0.75]}; % width of columns
[axs,fig_] = getPLOT_axes(num, wid, hts, cols, 3, 3, [], 'Razmi et al'); % etc
set(axs,'Units','normalized');
% draw in each panel, one at a time


lw=0;
w2=1;
exSub=20;


for xx = 1:length(axs)
    axes(axs(xx)); hold on; cla(gca)
    
    if xx==1
        hold on
        plot([-300 300],[0 0],'LineStyle','--','Color',[0 0 0.2],'LineWidth',2)
        plot([-300 300],[-300 300],'LineStyle','--','Color',[0 0 0.2],'LineWidth',2)
        s=scatter(PE(10:end),UP(10:end),100,pCha(10:end),'filled');
        s.MarkerFaceAlpha =1;
        c=colorbar;
        colormap((copper))
        c.Label.String = 'Change Point Probability';
        xlabel('Prediction Error','FontSize',14,'FontWeight','bold')
        ylabel('Update','FontSize',14,'FontWeight','bold')
        hold off
        
    elseif xx==2
        hold on
        plot([-300 300],[0 0],'LineStyle','--','Color',[0 0 0.2],'LineWidth',2)
        plot([-300 300],[-300 300],'LineStyle','--','Color',[0 0 0.2],'LineWidth',2)
        s=scatter(PE(10:end),UP(10:end),100,RU(10:end),'filled');
        s.MarkerFaceAlpha =1;
        c=colorbar;
        colormap((copper))
        c.Label.String = 'Relative Uncertainty';
        xlabel('Prediction Error','FontSize',14,'FontWeight','bold')
        ylabel('Update','FontSize',14,'FontWeight','bold')
        
        
    elseif xx==3
        hold on
        plot(1:11,mean(fixedTrialLR),'LineWidth',3);
        plot(1:11,mean(groundTruthTrialLR),'LineWidth',3);
        plot(1:11,mean(DynamicTrialLR),'LineWidth',3);
        boundedline(1:11,mean(humanSubCE),std(humanSubCE)/sqrt(32));        
        ylabel('Learning Rate')
        xlabel('Trials after a change point')
        xlim([1 10])
        %legend('Fixed context shift','Ground Truth Model','Dynamic context shift model','Human Subjects')

    elseif xx==4
        hold on
        for i=1:32
            scatter(1,bSubs(i,2),'filled','MarkerFaceColor',[0.8 0.8 0.8],'jitter','on','jitterAmount',0.2);
            scatter(2,bSubs(i,3),'filled','MarkerFaceColor',[0.8 0.8 0.8],'jitter','on','jitterAmount',0.2);
            scatter(3,bSubs(i,4),'filled','MarkerFaceColor',[0.8 0.8 0.8],'jitter','on','jitterAmount',0.2);
            plot(2,b_nn(3,end-1),'o','MarkerFaceColor','r','MarkerSize',8)
            plot(2,b_nn(3,end),'o','MarkerFaceColor','b','MarkerSize',8)
            plot(1,b_nn(2,10),'o','MarkerFaceColor','g','MarkerSize',8)
            plot(2,b_nn(3,10),'o','MarkerFaceColor','g','MarkerSize',8)
            plot(3,b_nn(4,10),'o','MarkerFaceColor','g','MarkerSize',8)
            plot(1,b_nn(2,end-1),'o','MarkerFaceColor','r','MarkerSize',8)
            plot(1,b_nn(2,end),'o','MarkerFaceColor','b','MarkerSize',8)
            plot(3,b_nn(4,end-1),'o','MarkerFaceColor','r','MarkerSize',8)
            plot(3,b_nn(4,end),'o','MarkerFaceColor','b','MarkerSize',8)
            plot([0 5],[0 0],'--k')
            
        end
        xlim([0.5 3.5])
        ylabel('coefficient')
        xlabel('term')
        set(gca, 'XTick',[1 2 3])

    end
    
    
    setPLOT_panelLabel(gca, xx);
end

kk=annotation('textbox');
set(kk, 'string', ' Figure 4', 'position', [0.85 0.95 0.15 0.05], 'EdgeColor', 'none')

saveas(gcf,  'figure4.fig', 'fig')
saveas(gcf,  'figure4.eps', 'epsc2')
close(gcf)

