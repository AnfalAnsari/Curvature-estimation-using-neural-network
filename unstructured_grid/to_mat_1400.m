folderArray = ["1400unstruc_1"];
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
            
     elseif fileName == "cell_vertices.txt"
          
           
     elseif fileName == "cell_vertex_neighbours.txt"
    
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
