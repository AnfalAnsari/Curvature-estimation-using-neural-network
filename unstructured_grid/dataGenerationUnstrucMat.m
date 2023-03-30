clear
close all


numOfCellNeighbours = 9;

global volumeFraction;
volumeFraction = [];

global target;
target = [];

global cellNumbers;
cellNumbers = [];

% GETTING ALL FILES IN THE FOLDER
% ["200unstruc", "600unstruc", "800unstruc", "1000unstruc","1400unstruc_1", "1400unstruc_2", "1200unstruc_1", "1200unstruc_2",]
folderArray = ["1000unstruc","1400unstruc_1", "1400unstruc_2", "1200unstruc_1", "1200unstruc_2",];
absolutePath = "E:\BTP_CURVATURE_ESTIMATION_DATA\unstruc_mat_files\";

for z=1:numel(folderArray)

    folderName = folderArray(z);
    fileDirectory = dir(absolutePath + folderName);
    for i=3:length(fileDirectory)

        load (absolutePath + folderName + "\" + folderName + "_" + "cell_area.mat", "cellArea");
        load (absolutePath + folderName + "\" + folderName + "_" +  "cell_vertex_neighbours.mat", "cellVertexNeighbours");
        load (absolutePath + folderName + "\"  + folderName + "_" +  "cell_vertices.mat", "cellVertices");

        fileName = fileDirectory(i).name;
        display(folderName + " " + fileName)
        if fileName ~= folderName + "_" + "cell_area.mat" && fileName ~= folderName + "_" + "cell_vertices.mat" && fileName ~=  folderName + "_" + "cell_vertex_neighbours.mat"

            load (absolutePath + folderName + "\" + fileName, "data");
            volumeFractionList = data;
            radius= split(fileName, ["_r", ".mat"]);
            radius = str2double(cell2mat(radius(2)));

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
                    cellNumbers(dataIndex,1) = i;

                    %  SAVING VOLUME FRACTION FOR EACH CELL
                    for k=1:numOfCellNeighbours
                        volumeFraction(dataIndex,k) = volumeFractionList(1,neighbours(k)+1);
                    end

                    % SAVING TARGET FOR EACH CELL
                    %target(dataIndex,1) = (1/radius)*sqrt(cellArea(i));
                     
                    gridSize= split(fileName, ["unstruc"]);
                    gridSize = str2double(cell2mat(gridSize(1)));
                    target(dataIndex,1) = (1/radius)*(1/gridSize);

                    


                end
            end



        end
    end
    
    outputFolder = "C:\Users\Admin\Downloads\BTP_CURVATURE_ESTIMATION\unstructured_grid\generated_data\without_root_cell_area\";
    save(outputFolder + folderName + "_data", "volumeFraction", "target", "cellNumbers");
    volumeFraction =[];
    target = [];
    cellNumbers = [];

end



