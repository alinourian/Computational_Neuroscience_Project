function [control,spike] = getControlAndSpike(Stimuli,Max,msq1D)
    control = [] ;
    spike = [] ;
    STA = mean(Stimuli,3);
    
    for i=1:length(Stimuli)
        temp = sum((STA).*(Stimuli(:,:,i)),'all') ;
        spike = cat(1,spike,temp) ;
    end
    
    control_events = ceil(max(Max).*rand(1,length(Stimuli)));
    control_matrix3D = Func_StimuliExtraction(control_events,msq1D) ;
    
    for i=1:length(control_matrix3D)
       temp = sum(STA .* control_matrix3D(:,:,i),'all');
       control = cat(1,control,temp);
    end
end