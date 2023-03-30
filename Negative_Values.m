load data_without_additional_values.mat
volumeFraction = 1 - volumeFraction ;
cur = (-1)*cur ;

save ("Negative_Values_data_without_additional_values.mat" ,"cur","volumeFraction")