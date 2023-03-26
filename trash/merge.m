clear all
close all
clc
%% loading data
% Create example data
y = load('data_0.125.mat');
z = load('data_0.225.mat');
q = load('data_0.425.mat');
w = load("data_0.325.mat");
vrs = fieldnames(y);

for k = 1:length(vrs)
    x.(vrs{k}) = [y.(vrs{k});z.(vrs{k});q.(vrs{k});w.(vrs{k})];
end
% Save result in a new file
save('data.mat','-struct','x')