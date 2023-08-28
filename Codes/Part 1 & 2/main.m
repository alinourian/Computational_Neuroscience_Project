%% ============================= load date ================================
clear; clc; close all;

load 'msq1D.mat';

%% ======================== check func. fget_spk ==========================
clc; clear;

str = 'Data\Spike_and_Log_Files\000412.a01\';
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
clc;

neuronsCodeStruct = dir('Data\Spike_and_Log_Files');
neuronsCode = cell(length(neuronsCodeStruct)-2,1);
for i=3:length(neuronsCodeStruct)
     neuronsCode{i-2} = neuronsCodeStruct(i).name;
end

rates = zeros(length(neuronsCode),1);
for i=1:length(neuronsCode)
     neuron = Func_ReadData(neuronsCode{i});
     rates(i) = getSpikeCountRate(neuron);
end

bar(rates); hold on; grid minor;
xlabel('Neurons','Interpreter','latex'); ylabel('Spike-Count Rate','Interpreter','latex');
yline(2,'--r','linewidth',2);

remainedRates = find(rates >= 2);
removedRates = find(rates < 2);

disp('Removed neurons code : ');
disp(neuronsCode(removedRates));
%% ================== check func. Func_StimuliExtraction ==================
clc;
load 'msq1D.mat';

% Output = Func_ReadData('000412.a01');
% Stimuli = Func_StimuliExtraction(Output(1).events, msq1D);

events = event;
SpikeTriggeredStimuli = Func_StimuliExtraction(events, msq1D);

%% ========================= Output of func. tview ========================
clc; clear;

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

%% ================================ END ====================================