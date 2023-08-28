%% //////////////// PART 4: Spike-Triggered Correlation \\\\\\\\\\\\\\\\\\\
%% ==================== check func. SpatioTemporal ========================
clc; clear;
load('msq1D');
neuronCode = '000601.c05';
Neuron = Func_ReadData(neuronCode);
ReceptiveFeilds = SpatioTemporal(Neuron);

%% ================== check func. CondfidenceInterval =====================
SpikeTriggeredStimuli = [];
for i=1:length(Neuron)
    temp = Func_StimuliExtraction(Neuron(i).events, msq1D);
    SpikeTriggeredStimuli = cat(3,SpikeTriggeredStimuli,temp);
end

%
controlMat = control_matrixGenerator(Neuron);

Control = reshape(controlMat, 256, size(controlMat,3));
ControlMatrix = 1/size(Control,2) * (Control) * (Control.') ;


[eigVecSpikes,eigValSpikes] = Decompose(SpikeTriggeredStimuli);
[eigVecControl,eigValControl] = Decompose(controlMat);

SDval = 20.8;
estimationLow = eigValControl - SDval*std(eigValControl)/sqrt(length(eigValControl));
estimationHigh = eigValControl + SDval*std(eigValControl)/sqrt(length(eigValControl));

rank = 1:256;
eigValSpikes = sort(eigValSpikes,'descend'); 
estimationLow = sort(estimationLow,'descend'); 
estimationHigh = sort(estimationHigh,'descend');
plot(rank,eigValSpikes,'o',rank,estimationHigh,'--',rank,estimationLow,'.');
legend('Eigen Values','+20.8SD Eigen Values','-20.8SD Eigen Values');
xlim([1 30]);
grid on;

%% ================= check func. CorrelationProjection ====================
principalEigVec = eigVecSpikes(:,1:2);
CorrelationProjection(SpikeTriggeredStimuli, controlMat, principalEigVec);

%% =================== check Seperation of Triggers =======================
