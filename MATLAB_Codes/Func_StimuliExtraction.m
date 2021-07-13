function SpikeTriggeredStimuli = Func_StimuliExtraction(events, trigger)
    N = length(events);
    SpikeTriggeredStimuli = zeros(16,16,N);
    Fs = 59.721395;
    ind = round(events*10^-4*Fs);
    
    %SpikeTriggeredStimuli = trigger(ind-15:ind,:);
    
    for i=1:N
        if ind(i)-15 > 0
             SpikeTriggeredStimuli(:,:,i) = trigger(ind(i)-15:ind(i),:);
        else
             SpikeTriggeredStimuli(:,:,i) = trigger(1:ind(i),:);
        end
    end
    
end