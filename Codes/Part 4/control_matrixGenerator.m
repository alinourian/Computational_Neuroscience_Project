function controlMat = control_matrixGenerator(Neuron)
load('msq1D');
Fs = 59.72;
controlMat = [];
for i=1:length(Neuron)
    rndSpkTrain = ceil(size(msq1D,1)/Fs*(10^4)*rand(1,length(Neuron(i).events)));
    temp = Func_StimuliExtraction(rndSpkTrain, msq1D);
    controlMat = cat(3,controlMat,temp);
end

end