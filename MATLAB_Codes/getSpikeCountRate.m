function rate = getSpikeCountRate(input)
    rate = 0;
    L = length(input);
    for i=1:L
        event = input(i).events;
        temp = length(event) / (event(end)-event(1)) * 10^4;
        rate = rate + (1/L * temp);
    end
end