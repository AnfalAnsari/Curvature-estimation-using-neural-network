clear
close all
% input variables nx, ny, np, cur

nx = 1600;
ny = 1600;
np = nx*ny;
cur_value = 161.290322* (1/1600);

global fra
fra = zeros(np,9);

global vis
vis = zeros(nx, ny);

global np
np = 1;  

% filename = 'R=0.425.xlsx';
% input = xlsread(filename);
% input = input';

load 1600x1600_r0.006200.mat
input = data';



% input is array of 1 X (nx*ny)

matrix = zeros(nx,ny);

for i=1: (nx*ny)
    row = nx- ceil(i/ny)+1;
    col = rem(i,ny);
    if col == 0
        col = 200;
    end
    matrix(row , col) = input(1,i);
end

save("matrix.mat", "matrix");

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

save("data", "volumeFraction", "cur","-v7.3");

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
    
    display(x + " " + y + " " + new_x + " " + new_y)
    fra(factionIndex,i) = matrix(new_x, new_y);
    
    if (vis(new_x,new_y)~=1) &&  (matrix(new_x,new_y)~=0) && (matrix(new_x,new_y)~=1)
        np = np+1;
        dfs(matrix,new_x,new_y);
    end
end
end