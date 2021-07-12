%% ============================= load date ================================

clear; clc; close all;

load 'msq1D.mat';

%% ======================== check func. fget_spk ==========================
clc;
str = 'Data\Spike_and_Log_Files\';
[events,hdr] = fget_spk([str,'000412.a01\000412.a01atune.sa0'],'hdr');

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
clc;
clear;
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

load 'msq1D.mat';
Stimuli = Func_StimuliExtraction(events, msq1D);

%%
clc; clear;
flog = tview('Data\Spike_and_Log_Files\000412.a01\000412.a01atune.log');



