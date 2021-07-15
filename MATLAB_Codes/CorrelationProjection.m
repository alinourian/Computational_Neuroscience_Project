function CorrelationProjection(events, eigVec)
load('msq1D');
SpikeTriggered = Func_StimuliExtraction(events, msq1D);
SpikeTriggered = reshape(SpikeTriggered,256,size(SpikeTriggered,3));
X1 = (eigVec(:,1).') * SpikeTriggered;
X2 = (eigVec(:,2).') * SpikeTriggered;
histogram(X1)
histogram(X2)


remainder = mod(size(msq1D,1),16);
AllTriggered = msq1D(1:end-remainder,:).';
AllTriggered = reshape(AllTriggered, 256, size(AllTriggered,2)/16);
Y1 = (eigVec(:,1).') * AllTriggered;
Y2 = (eigVec(:,2).') * AllTriggered;

histogram2(X1,X2); hold on;
histogram2(Y1,Y2);
legend('Spikes','All Triggeres');
end