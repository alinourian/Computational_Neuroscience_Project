function SpikeTriggeredStimuli = Func_StimuliExtraction(events, trigger)
    N = length(events);
    SpikeTriggeredStimuli = zeros(16,16,N);
    Fs = 59.721395;
    ind = ceil( (events*Fs) / 1e04);
    
    for i=1:N
        if (ind(i)>15 && ind(i)<32767)
             SpikeTriggeredStimuli(:,:,i) = trigger(ind(i)-15:ind(i),:);
        end
    end
end