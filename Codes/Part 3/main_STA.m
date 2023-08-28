%% ======================== spike trigger averaging =======================
clc; clear;
load 'msq1D.mat';
Fs = 59.721395;

Output = Func_ReadData('000601.c05');

temp = [];
Stimuli = [];
Max = [];
for i=1:length(Output)
    event = Output(i).events;
    temp = Func_StimuliExtraction(event, msq1D);
    Stimuli = cat(3,Stimuli,temp);
    Max = cat(1,Max,max(Output(i).events));
end
%% 1 - receptive field (STA)
receptive_field = mean(Stimuli,3);
% imshow(receptive_field,[-1 1]); xlabel('Spatial'); ylabel('Temporal');

%% 2 - p_values (optional)

p_value = zeros(16,16) ;
for i = 1:16
    for j = 1: 16
     [h, p_value(i,j)] = ttest(Stimuli(i,j,:)) ;
    end
end
figure; 
subplot(121); imshow(receptive_field,[-1 1]);
xlabel('Spatial'); ylabel('Temporal'); title('STA');
subplot(122); imshow(1-p_value);
xlabel('Spatial'); ylabel('Temporal'); title('1-PValues');

%% 3 - Spike-Control histogram
[Control,Spike] = getControlAndSpike(Stimuli,Max,msq1D);
figure;
histogram(Spike,'Normalization','probability','BinWidth',0.1); hold on;
histogram(Control,'Normalization','probability','BinWidth',0.1); grid minor;
legend('Spike','Control');

%% 4 - t-test for Spike and Control (optional)

[h_spike, p_spike] = ttest(Spike);
[h_control, p_control] = ttest(Control);

fprintf('h_spike = %d,\t p_spike = %f\n\n',h_spike, p_spike);
fprintf('h_control = %d,\t p_control = %f\n\n',h_control, p_control);
%% 5 - fitting gaussians on datas

mu1 = mean(Spike);
mu2 = mean(Control);

sigma1 = var(Spike);
sigma2 = var(Control);

dist1 = @(x) 1/sqrt(2*sigma1^2*pi) * exp(-(x-mu1).^2 / (2*sigma1^2));
dist2 = @(x) 1/sqrt(2*sigma2^2*pi) * exp(-(x-mu2).^2 / (2*sigma2^2));

threshold = fzero(@(x) dist1(x)-dist2(x), rand * (mu1-mu2) + (mu1+mu2));
STA_Success_Percent = length(find((dist1(Spike)-dist2(Spike))>0))/length(Spike);

fprintf('threshold=%f\n\n',threshold);
fprintf('STA_Success_Percent=%f\n\n',STA_Success_Percent);
% ================================= END ===================================