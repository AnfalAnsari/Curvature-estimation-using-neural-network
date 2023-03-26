clear
close all

% GETTING ALL FILES IN THE FOLDER
folderName = "input_additional_mat_files";
fileDirectory = dir("./" + folderName); 
for i=3:length(fileDirectory)
    
    fileName = fileDirectory(i).name;
               
    % CALCULATING THE GRID SIZE AND CURVATURE FROM FILE NAME
    gridSize = split(fileName, ["x","_"]);
    gridSize = str2num(cell2mat(gridSize(2)));

    cur = split(fileName, ["r", ".mat"]);
    cur = str2num(cell2mat(cur(2)));
    load (folderName + "/" + fileName);
    input = data';
    display(fileName + " " + gridSize + " " + cur )
     generateData(gridSize,gridSize,1/(gridSize*cur),input);
 end




function generateData(nx, ny, cur_value, input)
    
    global np
    np = 1;  
    global fra
    fra = zeros(nx*ny,9);
    global vis
    vis = zeros(nx, ny);
    
    matrix = zeros(nx,ny);
    
    for i=1: (nx*ny)
        row = nx- ceil(i/ny)+1;
        col = rem(i,ny);
        if col == 0
            col = 200;
        end
        matrix(row , col) = input(1,i);
    end
    
    for i = 1:nx
        for j = 1:ny
            if (matrix(i,j)~=0) && (matrix(i,j)~=1 && vis(i,j)~=1)
                dfs(matrix,i,j);
            end
        end
    end
    
    volumeFraction = zeros(np,9);
    cur = zeros(np,1);
    for i=1:np
        for j=1:9
            volumeFraction(i,j) = fra(i,j);
        end
            cur(i) = cur_value;
        
    end    
    
   
   fileName = "data_with_only_additional_values.mat";

    m = matfile(fileName, 'Writable',true);
    
    if size(who(m)) == 0
        save(fileName,'volumeFraction', 'cur');
    else    
    m.volumeFraction = [m.volumeFraction;volumeFraction];
    m.cur = [m.cur;cur];
    end
end


function dfs(matrix,x,y)
global vis;
global fra;
global np;
vis(x,y) = 1;
dx = [-1 -1 -1 0 0 0 1 1 1];
dy = [-1 0 1 -1 0 1 -1 0 1];
factionIndex = np;

for i = 1:9
    new_x = x+dx(i); 
    new_y = y+dy(i);
    
    fra(factionIndex,i) = matrix(new_x, new_y);
    
    if (vis(new_x,new_y)~=1) &&  (matrix(new_x,new_y)~=0) && (matrix(new_x,new_y)~=1)
        np = np+1;
        dfs(matrix,new_x,new_y);
    end
end
end