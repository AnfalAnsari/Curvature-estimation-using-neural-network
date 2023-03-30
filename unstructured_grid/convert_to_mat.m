%folderArray = [ "Additional1200x1200", "Additional1400x1400", "Additional1600x1600"];
folderArray = ["200unstruc","400unstruc", "600unstruc", "800unstruc", "1000unstruc", "1200unstruc_1", "1200unstruc_2", "1400unstruc1", "1400unstruc_2",];
absolutePath = "E:\BTP_CURVATURE_ESTIMATION_DATA\";
for k = 1:numel(folderArray) 
    folderName = folderArray(k);
    
    % GETTING ALL FILES IN THE FOLDER
    fileDirectory = dir(absolutePath + folderName); 
    
    % CALCULATING THE DATA SIZE OF THE FILE FROM FOLDER NAME
    dataSize = split(folderName, "x");
    dataSize = str2num(dataSize(1));
    dataSize = dataSize*dataSize;
    
    for i=3:length(fileDirectory)
        convertToMatFile(folderName,fileDirectory(i).name,dataSize);
    end
end

%CONVERT TO MAT FILE
function convertToMatFile(folderName, fileName, dataSize)
     absolutePath = "E:\BTP_CURVATURE_ESTIMATION_DATA\";
     if fileName == "cell_area.txt"
            fid = fopen(absolutePath + folderName+'\' + fileName ,'r');
            tline = fgetl(fid);
            cellArea  = zeros(dataSize,1);
            while ischar(tline)
                dataStr = convertCharsToStrings(tline);
                data = split(dataStr, "	");
                cellArea(end+1,1) = str2double(data(2));
                tline = fgetl(fid);
            end
            fclose(fid);
            matFileName = split(fileName,".txt");
            matFileName = matFileName(1) + ".mat";
            matFileName = folderName + "_" + matFileName; %STORING MAT FILE IN FORMAT 400X400_r0.022500.mat
            save(absolutePath + "\"+folderName+"_matfiles\"+ matFileName ,  "cellArea");
     elseif fileName == "cell_vertices.txt"
            fid = fopen( absolutePath + folderName+'\' + fileName ,'r');
            tline = fgetl(fid);
            cellVertices=[];
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
            matFileName = split(fileName,".txt");
            matFileName = matFileName(1) + ".mat";
            matFileName = folderName + "_" + matFileName; %STORING MAT FILE IN FORMAT 400X400_r0.022500.mat
            save(absolutePath+ "\"+folderName+"_matfiles\" + matFileName ,  "cellVertices");
      elseif fileName == "cell_vertex_neighbours.txt"
    
            fid = fopen(absolutePath + folderName+'\' + fileName ,'r');
            
            tline = fgetl(fid);
            cellVertexNeighbours=[];
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
            matFileName = split(fileName,".txt");
            matFileName = matFileName(1) + ".mat";
            matFileName = folderName + "_" + matFileName; %STORING MAT FILE IN FORMAT 400X400_r0.022500.mat
            save(absolutePath + "\"+folderName+"_matfiles\"+ matFileName ,  "cellVertexNeighbours");
     else
        fid = fopen(absolutePath + folderName+'/' + fileName ,'r');
        tline = fgetl(fid);
        flag = 0;
        data  = zeros(dataSize,1);
        dataIndex = 1;
    
        while ischar(tline)
        
        
            if tline == "LOOKUP_TABLE default"  %ONLY READING DATA AFTER "LOOKUP_TABLE default"
                flag = 1;
                tline = fgetl(fid);
            end
        
            if flag == 1
                dataStr = convertCharsToStrings(tline);
                data(dataIndex) = double(dataStr);
                dataIndex = dataIndex+1;
            end
    
            tline = fgetl(fid);
        end
        fclose(fid);
        matFileName = split(fileName,".vtk");
        matFileName = matFileName(1) + ".mat";
        matFileName = folderName + "_" + matFileName; %STORING MAT FILE IN FORMAT 400X400_r0.022500.mat
        save(absolutePath + "\"+folderName+"_matfiles\"+ matFileName ,  "data");
     end
end 
