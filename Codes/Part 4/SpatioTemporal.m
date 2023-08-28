function [receptiveField, eigD] = SpatioTemporal(Neuron)
load('msq1D.mat');
SpikeTriggeredStimuli = [];
for i=1:length(Neuron)
    temp = Func_StimuliExtraction(Neuron(i).events, msq1D);
    SpikeTriggeredStimuli = cat(3,SpikeTriggeredStimuli,temp);
end

[V,D] = Decompose(SpikeTriggeredStimuli);

eigD = D;
receptiveField = V;

figure;
receptiveField1 = reshape(receptiveField(:,1),16,16);
receptiveField1 = imresize(receptiveField1, 20);
imshowpair(receptiveField1,histeq(receptiveField1),'montage');
xlabel('Spatial','Interpreter','LaTeX');
ylabel('Temporal','Interpreter','LaTeX');
title('First EigenVector','Interpreter','LaTeX');

figure;
receptiveField2 = reshape(receptiveField(:,2),16,16);
receptiveField2 = imresize(receptiveField2, 20);
imshowpair(receptiveField2,histeq(receptiveField2),'montage');
xlabel('Spatial','Interpreter','LaTeX');
ylabel('Temporal','Interpreter','LaTeX');
title('Second EigenVector','Interpreter','LaTeX');

figure;
receptiveField3 = reshape(receptiveField(:,3),16,16);
receptiveField3 = imresize(receptiveField3, 20);
imshowpair(receptiveField3,histeq(receptiveField3),'montage'); 
xlabel('Spatial','Interpreter','LaTeX');
ylabel('Temporal','Interpreter','LaTeX');
title('Third EigenVector','Interpreter','LaTeX');

end