function rate = getSpikeCountRate(input)
    Fs = 59.721395;             % refer to the paper
    N = 32767;                  % numbers of stimuli
    rate = 0;
    L = length(input);
    for i=1:L
        event = input(i).events;
%         temp = length(event) / (event(end)-event(1)) * 10^4;
        temp = length(event) / (N / Fs);
        rate = rate + (1/L * temp);
    end
end