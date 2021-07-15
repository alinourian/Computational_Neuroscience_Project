function SpikeTriggeredStimuli = Func_StimuliExtraction(events, trigger)
    N = length(events);
    SpikeTriggeredStimuli = zeros(16,16,N);
<<<<<<< HEAD
    Fs = 59.721395;
    ind = round(events*(10^(-4))*Fs);
    
    %SpikeTriggeredStimuli = trigger(ind-15:ind,:);
=======
    Fs = 59.7;
    ind = round(events*(10^-4)*Fs);
>>>>>>> 0f1cfb15965c2b5cbd50980aa95238869aa97c87
    
    for i=1:N
        if ind(i)-15 > 0
             SpikeTriggeredStimuli(:,:,i) = trigger(ind(i)-15:ind(i),:);
        else
<<<<<<< HEAD
             SpikeTriggeredStimuli(:,:,i) = trigger(1:ind(i),:);
=======
             SpikeTriggeredStimuli(1:ind(i),:,i) = trigger(1:ind(i),:);
>>>>>>> 0f1cfb15965c2b5cbd50980aa95238869aa97c87
        end
    end
    
end