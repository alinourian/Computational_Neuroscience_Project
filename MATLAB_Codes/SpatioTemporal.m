function [receptiveField, eigD] = SpatioTemporal(event)
load('msq1D.mat');
SpikeTriggeredStimuli = Func_StimuliExtraction(event, msq1D);

[V,D] = Decompose(SpikeTriggeredStimuli);

eigD = D;
receptiveField = V;

figure;
subplot(1,3,1)
receptiveField1 = reshape(receptiveField(:,1),16,16);
% receptiveField1 = mat2gray(receptiveField1);
imshow(receptiveField1)
xlabel('Spatial','Interpreter','LaTeX');
ylabel('Temporal','Interpreter','LaTeX');

subplot(1,3,2)
receptiveField2 = reshape(receptiveField(:,2),16,16);
% receptiveField2 = mat2gray(receptiveField2);
imshow(receptiveField2)
xlabel('Spatial','Interpreter','LaTeX');
ylabel('Temporal','Interpreter','LaTeX');

subplot(1,3,3)
receptiveField3 = reshape(receptiveField(:,3),16,16);
% receptiveField3 = mat2gray(receptiveField3);
imshow(receptiveField3)
xlabel('Spatial','Interpreter','LaTeX');
ylabel('Temporal','Interpreter','LaTeX');

end