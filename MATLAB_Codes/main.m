%% ============================= load date ================================
clear; clc; close all;

load 'msq1D.mat';

%% ======================== check func. fget_spk ==========================
clc; clear;

str = 'Data\Spike_and_Log_Files\000412.a01\';
% [events,hdr] = fget_spk([str,'000412.a01atune.sa0'],'hdr');
[events,hdr] = fget_spk('000412.a01atune.sa0','hdr');

%% ===================== check func. Func_ReadData ========================
clc; clear;
Output = Func_ReadData('000412.a01');

event = Output(1).events;
y = ones(1,length(event));
stem(event,y,'filled');
xlim([event(1), event(end)]); ylim([0 1.5]); grid minor;

%% =================== check func. getSpikeCountRate ======================
clc;
rate = getSpikeCountRate(Output);

%% ========================== plot histogram ==============================
clc; clear;

neuronsCodeStruct = dir('Data\Spike_and_Log_Files');
neuronsCode = cell(length(neuronsCodeStruct)-2,1);
for i=3:length(neuronsCodeStruct)
     neuronsCode{i-2} = neuronsCodeStruct(i).name;
end

rates = zeros(length(neuronsCode),1);
for i=1:length(neuronsCode)
     neuronCode = Func_ReadData(neuronsCode{i});
     rates(i) = getSpikeCountRate(neuronCode);
end

bar(rates); hold on;
yline(2,'--r','linewidth',2);

remainedRates = find(rates >= 2);
removedRates = find(rates < 2);

%% ================== check func. Func_StimuliExtraction ==================
clc;
load 'msq1D.mat';
<<<<<<< HEAD
Output = Func_ReadData('000412.a01');
Stimuli = Func_StimuliExtraction(Output(1).events, msq1D);
=======
events = event;
SpikeTriggeredStimuli = Func_StimuliExtraction(events, msq1D);
>>>>>>> 0f1cfb15965c2b5cbd50980aa95238869aa97c87

%% ========================= Output of func. tview ========================
clc; clear;
<<<<<<< HEAD

mydir  = pwd; cd 'Data\Spike_and_Log_Files\000412.a01';
flog1 = tview('000412.a01atune.log'); cd(mydir);

mydir  = pwd; cd 'Data\Spike_and_Log_Files\000412.a01';
flog2 = tview('000412.a01ftune.log'); cd(mydir);

mydir  = pwd; cd 'Data\Spike_and_Log_Files\000511.b10';
flog3 = tview('000511.b10otune.log'); cd(mydir);

mydir  = pwd; cd 'Data\Spike_and_Log_Files\000802.c07';
flog4 = tview('000802.c07atune.log'); cd(mydir);

mydir  = pwd; cd 'Data\Spike_and_Log_Files\011101.A.d03';
flog5 = tview('011101.A.d03atune.log'); cd(mydir);

mydir  = pwd; cd 'Data\Spike_and_Log_Files\020321.A.i01';
flog6 = tview('020321.A.i01atune.log'); cd(mydir);
%% ========================================================================
=======
tview('000412.a01atune.log')

%% //////////////// PART 4: Spike-Triggered Correlation \\\\\\\\\\\\\\\\\\\
%% ==================== check func. SpatioTemporal ========================
clc; clear;
load('msq1D');
neuronCode = '000412.a01';
Output = Func_ReadData(neuronCode);
event = Output(1).events;
ReceptiveFeilds = SpatioTemporal(event);

%% ================== check func. CondfidenceInterval =====================
[estimationLow, estimationHigh] = confidenceInterval(event, 5.2, 10);
SpikeTriggeredStimuli = Func_StimuliExtraction(event, msq1D);
[eigVec,eigVal] = Decompose(SpikeTriggeredStimuli);
rank = 1:256;
eigVal = sort(eigVal,'descend'); 
estimationLow = sort(estimationLow,'descend'); 
estimationHigh = sort(estimationHigh,'descend');
plot(rank,eigVal,'o',rank,estimationHigh,'--',rank,estimationLow,'.');
legend('Eigen Values','+5.2SD Eigen Values','-5.2SD Eigen Values');
xlim([1 256]);
>>>>>>> 0f1cfb15965c2b5cbd50980aa95238869aa97c87

%% ================= check func. CorrelationProjection ====================
principalEigVec = eigVec(:,1:2);
CorrelationProjection(event, principalEigVec);