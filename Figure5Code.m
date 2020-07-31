codeToRemoveJSErrors
clear all

load('trialInfluence.mat')
dynamicContextShiftCP

%% ------------------------------------------------------------------------
% Dissimilarity Matrix Heatmap:  
num        = 1;
wid        = 10; % total width
hts        = [5]; % height of each row
cols       = {1,1,1}; % width of columns
[axs,fig_] = getPLOT_axes(num, wid, hts, cols, [3], [3], [], 'Razmi et al'); 
set(axs,'Units','normalized');
lw         =1.5;
lw2        =3;
exSub      =20;

%% ------------------------------------------------------------------------
for xx = 1:length(axs)
    axes(axs(xx)); hold on; cla(gca)   
    if xx==1
       hold on 
  
 

    elseif xx==2

            matrix=squareform(pdist(totalContext));
            maxScores = max(max(matrix));
            minScores = min(min(matrix));
            normalizedMatrix = (matrix - minScores) / (maxScores - minScores);
            imagesc(flipud((normalizedMatrix(11:70,11:70))))
            colormap((parula))  
            colorbar       
        
    elseif xx==3
         imagesc(flipud((1-trialInfluence(11:70,11:70))))
         colormap((parula))  
         set(gca, 'XTick',[1 10 20 30 40 50 60],'XtickLabel',[1 10 20 30 40 50 60]) % 10 ticks 
         set(gca, 'YTick',1:10:60,'YTickLabel',60:-10:1) % 10 ticks 
         colormap((parula))  
         colorbar      

    end
    
    
    setPLOT_panelLabel(gca, xx);
end

 kk=annotation('textbox')
 set(kk, 'string', ' Figure 5', 'position', [0.85 0.95 0.15 0.05], 'EdgeColor', 'none')
 
saveas(gcf,  'figure5.fig', 'fig')
saveas(gcf,  'figure5.eps', 'epsc2')
close(gcf)

               
