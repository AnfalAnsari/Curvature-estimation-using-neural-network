fileName = "Additional600x600_r0.010167.mat";

gridSize = split(fileName, ["x","_"]);
gridSize = str2num(cell2mat(gridSize(2)));

cur = split(fileName, ["r", ".mat"]);
cur = str2num(cell2mat(cur(2)));
