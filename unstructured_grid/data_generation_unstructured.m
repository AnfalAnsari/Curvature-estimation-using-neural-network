clear
close all


numOfCellNeighbours = 9;

global cellArea
cellArea = [];

global cellVertices
cellVertices = [];

global cellVertexNeighbours
cellVertexNeighbours = [];

global volumeFraction;
volumeFraction = [];

global target;
target = [];


global cellNumbers;
cellNumbers = [];

% GETTING ALL FILES IN THE FOLDER
folderArray = ["200unstruc","400unstruc", "600unstruc", "800unstruc", "1000unstruc", "1200unstruc_1", "1200unstruc_2", "1400unstruc1", "1400unstruc_2",];
absolutePath = "E:\BTP_CURVATURE_ESTIMATION_DATA\";

for z=1:numel(folderArray)
   
   folderName = folderArray(z);
   fileDirectory = dir(absolutePath + folderName);
     for i=3:length(fileDirectory)
    
        fileName = fileDirectory(i).name;
        display(folderName + " " + fileName)
        if fileName == "cell_area.txt"
            fid = fopen(absolutePath + folderName+'\' + fileName ,'r');
            tline = fgetl(fid);
    
            while ischar(tline)
                dataStr = convertCharsToStrings(tline);
                data = split(dataStr, "	");
                cellArea(end+1,1) = str2double(data(2));
                tline = fgetl(fid);
            end
            fclose(fid);
        elseif fileName == "cell_vertices.txt"
            fid = fopen( absolutePath + folderName+'\' + fileName ,'r');
            tline = fgetl(fid);
    
            while ischar(tline)
                dataStr = convertCharsToStrings(tline);
                data = split(dataStr, "	");
                dataIndex = size(cellVertices);
                dataIndex = dataIndex(1)+1;
    
                for i=1:4
    
                    cellVertices(dataIndex,i) = str2double(data(i+1));
                end
                tline = fgetl(fid);
            end
            fclose(fid);
    
        elseif fileName == "cell_vertex_neighbours.txt"
    
            fid = fopen(absolutePath + folderName+'\' + fileName ,'r');
            
            tline = fgetl(fid);
    
            while ischar(tline)
                dataStr = convertCharsToStrings(tline);
                data = split(dataStr, "	");
                dataIndex = size(cellVertexNeighbours);
                dataIndex = dataIndex(1)+1;
    
                for i=1:9
    
                    cellVertexNeighbours(dataIndex,i) = str2double(data(i+1));
                end
                tline = fgetl(fid);
            end
            fclose(fid);
    
        else
    
    
            radius= split(fileName, ["r", ".vtk"]);
            radius = str2double(cell2mat(radius(2)));
    
            fid = fopen(absolutePath + folderName+'\' + fileName ,'r');
            tline = fgetl(fid);
            flag = 0;
            volumeFractionList = [];
            dataIndex = 1;
    
            while ischar(tline)
    
    
                if tline == "LOOKUP_TABLE default"  %ONLY READING DATA AFTER "LOOKUP_TABLE default"
                    flag = 1;
                    tline = fgetl(fid);
                end
    
                if flag == 1
                    dataStr = convertCharsToStrings(tline);
                    volumeFractionList(dataIndex) = double(dataStr);
                    dataIndex = dataIndex+1;
                end
    
                tline = fgetl(fid);
            end
            fclose(fid);
    
            for i=1:numel(cellArea)
                if volumeFractionList(i) ==1 || volumeFractionList(i) == 0
                    continue;
                end
    
                neighbours = [];
                for j=1:4
                    for k=1:9
                        currentVertex = cellVertices(i,j);
                        currentVertexNeighbour = cellVertexNeighbours(currentVertex,k);
                        if currentVertexNeighbour ==-1
                            break;
                        end
                        neighbours(end+1,1) = currentVertexNeighbour;
                    end
                end
    
                neighbours = unique(neighbours);
                
                sizeOfNeighbours = size(neighbours);
                if sizeOfNeighbours(1) == numOfCellNeighbours
                    dataIndex =  numel(volumeFraction)/numOfCellNeighbours + 1;
    
                    %SAVING CELL NUMBERS
                    cellNumbers(end+1) = i;
    
                    %  SAVING VOLUME FRACTION FOR EACH CELL
                    for k=1:numOfCellNeighbours
                        volumeFraction(dataIndex,k) = volumeFractionList(1,neighbours(k)+1);
                    end
    
                    % SAVING TARGET FOR EACH CELL
                    target(dataIndex,1) = (1/radius)*sqrt(cellArea(i));
    
                end
            end
              
    
    
        end
    end
   
   %  REINITIALISING GLOBAL VARIABLE FOR DIFFERENT GRID SIZE 
     cellArea = [];
     cellVertices = [];
     cellVertexNeighbours = [];
     cellNumbers = [];


end

save("unstructured_data_complete.mat", "volumeFraction", "target", "cellNumbers");

