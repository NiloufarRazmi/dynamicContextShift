
load('McGuireNassar2014data.mat')
outcome_sub=allDataStruct.currentOutcome(allDataStruct.subjNum==1);
noiseStd =  allDataStruct.currentStd(allDataStruct.subjNum==1);

B = nan(size(outcome))'; pCha = B; R = pCha;
% Use normative model to compute CPP, RU & (model)LR:
for i=1:4
    [B1, totSig, R1, pCha1, ~] = frugFun5(outcome_sub((i-1)*120+1:i*120)', Haz, noiseStd(i*120), 0, 1, false...
        , 150, .1);
    R(1,(i-1)*120+1:i*120)= R1(1:end-1);
    pCha_norm(1,(i-1)*120+1:i*120)= pCha1;
    norm_prediction(1,(i-1)*120+1:i*120)=B1(1:end-1);
end
RU_norm=1./(R(1:end-1)+1); % relative uncertainty
subj_prediction=allDataStruct.currentPrediction(allDataStruct.subjNum==1);
change=find(allDataStruct.isChangeTrial==1);

num        = 1;
wid        = 10; % total width
hts        = [5]; % height of each row
cols       = {1,1,1}; % width of columns
[axs,fig_] = getPLOT_axes(num, wid, hts, cols, [3], [3], [], 'Razmi et al'); % etc
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
        
        hold on
        plot(outcome_sub(1:60), 'or', 'markerFaceColor',[0.8 0.8 0.8], 'markerEdgeColor', 'k', 'lineWidth', 1, 'markerSize', 8)
        plot(norm_prediction(1:60),'color',[0 0.4 0.6],'lineWidth',5)
        plot(subj_prediction(1:60),'color',[1 0.4 0.6],'lineWidth',5)
        hold on
        for i=1:8
            plot([change(i) change(i)],[0 300],'--','Color',[0.5 0.5 0.5])
        end
        xlabel('Context')
        ylabel('Position')
        f=legend('outcome','Normative model','Subject 1 prediction')
        xticklabels({'1','2','3','4','5','6','7','8'})
        xticks(find(allDataStruct.isChangeTrial(1:60)==1))
        set(f, 'location', 'northwest', 'box','off')
        
    elseif xx==3
        
        hold on
        a=plot(RU_norm(1:60), 'Color',[0.2 0 0.4],'lineWidth',4);
        b=plot(pCha_norm(1:60), 'Color',[0.8 0 0.2],'lineWidth',4);
        
        hold on
        for i=1:8
            plot([change(i) change(i)],[0 1],'--','Color',[0.5 0.5 0.5])
        end
        ff=legend([a, b], {'relative uncertainty', 'changepoint probability'});
        set(ff, 'location', 'northeast', 'box','off')
    end
    
    
    setPLOT_panelLabel(gca, -10);
end

kk=annotation('textbox')
set(kk, 'string', ' Figure 1', 'position', [0.85 0.95 0.15 0.05], 'EdgeColor', 'none')

saveas(gcf,  'figure1.fig', 'fig')
saveas(gcf,  'figure1.eps', 'epsc2')
close(gcf)

