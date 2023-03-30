load unstructured_data_complete.mat

for i=1:numel(target)
     if target(i) == 0
        disp("0 found" + ' ' + i )
     end
end