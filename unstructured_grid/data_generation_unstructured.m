clear
close all


numOfCellNeighbours = 10;

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
folderName = "200x200_unstruc";
fileDirectory = dir("./" + folderName);
for i=3:length(fileDirectory)

    fileName = fileDirectory(i).name;

    if fileName == "cell_area.txt"
        fid = fopen('./'+ folderName+'/' + fileName ,'r');
        tline = fgetl(fid);

        while ischar(tline)
            dataStr = convertCharsToStrings(tline);
            data = split(dataStr, "	");
            cellArea(end+1,1) = str2double(data(2));
            tline = fgetl(fid);
        end
        fclose(fid);
    elseif fileName == "cell_vertices.txt"
        fid = fopen('./'+ folderName+'/' + fileName ,'r');
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

        fid = fopen('./'+ folderName+'/' + fileName ,'r');
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

        fid = fopen('./'+ folderName+'/' + fileName ,'r');
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
                target(dataIndex) = (1/radius)*sqrt(cellArea(i));

            end
        end

        save("unstructured_data_test.mat", "volumeFraction", "target", "cellNumbers");


    end
end