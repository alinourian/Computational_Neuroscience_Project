function [estimationLow, estimationHigh] = confidenceInterval(events, SDval, num)

spikesNum = length(events);
Fs = 59.721395;
load('msq1D');
Tmax = round(size(msq1D,1)/Fs * 10^4);
%%%%%%%%Implementation 1
% controlCorrelation = zeros(16,16,spikesNum);
% 
% for i=1:num
%     rndSpkTrain = randi([1 Tmax],1,spikesNum);
%     controlEnsemble = Func_StimuliExtraction(rndSpkTrain, msq1D);
%     controlCorrelation = controlCorrelation + controlEnsemble;
% end
% 
% controlCorrelation = controlCorrelation / num;
% [~,eigVals] = Decompose(controlCorrelation);
% 
% estimationLow = eigVals - SDval*std(eigVals)/sqrt(length(eigVals));
% estimationHigh = eigVals + SDval*std(eigVals)/sqrt(length(eigVals));

%%%%%%% Implementation 2
eigVals = zeros(256,1);
for i=1:num
    rndSpkTrain = randi([1 Tmax],1,spikesNum);
    controlEnsemble = Func_StimuliExtraction(rndSpkTrain, msq1D);
    [~,D] = Decompose(controlEnsemble);
    eigVals = eigVals + D;
end
eigVals = eigVals/num;

estimationLow = eigVals - SDval*std(eigVals)/sqrt(length(eigVals));
estimationHigh = eigVals + SDval*std(eigVals)/sqrt(length(eigVals));

end