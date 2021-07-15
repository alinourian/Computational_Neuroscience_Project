function [V,D] = Decompose(Data)
Stimuli = reshape(Data, 256, size(Data,3));
S = 1/size(Stimuli,2) * (Stimuli) * (Stimuli.') ;
[V,D] = eig(S);
D = diag(D);
end