s1 = load('data_without_additional_values.mat');
s2 = load('Negative_Values_data_without_additional_values.mat');
% vertical concatenate
cur=[s1.cur; s2.cur]; 
volumeFraction = [s1.volumeFraction; s2.volumeFraction];
save ("Merged_File.mat" ,"cur","volumeFraction")