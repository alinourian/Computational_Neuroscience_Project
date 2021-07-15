function SpikeTriggeredStimuli = Func_StimuliExtraction(events, trigger)
    N = length(events);
    SpikeTriggeredStimuli = zeros(16,16,N);
    Fs = 59.7;
    ind = round(events*(10^-4)*Fs);
    
    for i=1:N
        if ind(i)-15 > 0
             SpikeTriggeredStimuli(:,:,i) = trigger(ind(i)-15:ind(i),:);
        else
             SpikeTriggeredStimuli(1:ind(i),:,i) = trigger(1:ind(i),:);
        end
    end
    
end