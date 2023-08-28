function CorrelationProjection(SpikeTriggered, Control_Matrix, eigVec)

load('msq1D');
N = size(SpikeTriggered,3);
SpikeTriggered = reshape(SpikeTriggered,256,size(SpikeTriggered,3));
X1 = (eigVec(:,1).') * SpikeTriggered;
X2 = (eigVec(:,2).') * SpikeTriggered;

figure;
histogram(X1,'Normalization','probability')  
title('Histogram of Projecting spike tiggered stimulus on the first eigenvector','Interpreter','LaTeX');
figure;
histogram(X2,'Normalization','probability')
title('Histogram of Projecting spike tiggered stimulus on the second eigenvector','Interpreter','LaTeX');

control_events = ceil(size(msq1D,1)*rand(1,N));
Control_Matrix = Func_StimuliExtraction(control_events , msq1D);
Control_Matrix = reshape(Control_Matrix, 256, size(Control_Matrix,3));
Y1 = (eigVec(:,1).') * Control_Matrix;
Y2 = (eigVec(:,2).') * Control_Matrix;

figure;
histogram2(X1,X2,'Normalization','probability'); hold on;
histogram2(Y1,Y2,'Normalization','probability');
xlabel('V1');
ylabel('V2');
legend('Spikes','Control');
end