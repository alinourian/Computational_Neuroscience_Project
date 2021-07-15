%% ======================== spike trigger averaging =======================
clc; clear;
load 'msq1D.mat';
Output = Func_ReadData('011101.A.d03');
Stimuli = Func_StimuliExtraction(Output(1).events, msq1D);
%%result = mean(Stimuli,3);
%%imshow(result);