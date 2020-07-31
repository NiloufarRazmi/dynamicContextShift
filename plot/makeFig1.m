% makeFig1


num        = 1;
wid        = 12; % total width
hts        = [2.5, 2.5, 2.5, 2.5]; % height of each row
cols       = {1, [.85 .15], [.85 .15], [.85 .15]}; % width of columns
[axs,fig_] = getPLOT_axes(num, wid, hts, cols, [], [], [], ''); % etc
set(axs,'Units','normalized');
% draw in each panel, one at a time


lw=1.5
lw2=3
exSub=12



for xx = 1:length(axs)
    axes(axs(xx)); hold on; cla(gca)
    if xx==1
        
        set(gca, 'visible', 'off')
        
    elseif xx==2
        
        
        plot(1:10, 1:10, 'k')
        set(gca, 'box', 'off')
        
        
        
        
        
    elseif xx==3
     set(gca, 'box', 'off')
        
           
        
        
    elseif xx==4
        
        
      set(gca, 'box', 'off')
        
          
    elseif xx==5
     set(gca, 'box', 'off')
        
           
        
    elseif xx==6
        
        hold on
    set(gca, 'box', 'off')
        
             
    elseif xx==7
        hold on
 set(gca, 'box', 'off')
        
               
    end
    
    
    setPLOT_panelLabel(gca, -10);
end

 kk=annotation('textbox')
 set(kk, 'string', 'Nassar et al 2009 Figure 1', 'position', [0.85 0.95 0.15 0.05], 'EdgeColor', 'none')
 


saveas(gcf,  'figure1new.fig', 'fig')
saveas(gcf,  'figure1new.eps', 'epsc2')
close(gcf)