clear
close all
% input variables nx, ny, np, cur

nx = 100;
ny = 100;
np = nx*ny;

global fra
fra = zeros(np,9);
global curvature;
curvature = zeros(np,1);

global vis
vis = zeros(nx, ny);

global np
np = 1;  

% filename = 'R=0.425.xlsx';
% input = xlsread(filename);
% input = input';

load 100x100_circle_patch.mat
input = data';



% input is array of 1 X (nx*ny)

matrix = zeros(nx,ny);

for i=1: (nx*ny)
    col = ceil(i/ny); 
    row = ny - rem(i,nx) + 1;
    
    if(row == nx+1)
       row = 1;
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
        cur(i) =  curvature(i);
    end
end    

save("data_sine_wave_left_to_right_order", "volumeFraction", "cur","-v7.3");

function dfs(matrix,x,y)
global vis;
global fra;
global np;
global curvature;

vis(x,y) = 1;

if ( (x == 50 && y == 1) || (x == 49 && y == 1) || (x==51 && y==100 ) || (x==52 && y==100 ) )
    np = np-1;
    return
end

% dx = [1 0 -1 1 0 -1 1 0 -1];
% dy = [1 1 1 0 0 0 -1 -1 -1];
 dx = [-1 -1 -1 0 0 0 1 1 1];
 dy = [-1 0 1 -1 0 1 -1 0 1];


factionIndex = np;

display(np + " " + x + " " + " " + y)

for i = 1:9
    new_x = x+dx(i); 
    new_y = y+dy(i);
    
    % display(x + " " + y + " " + new_x + " " + new_y)
    fra(factionIndex,i) = matrix(new_x, new_y);

    mid_x = (2*x-1)/200;
    curvature(factionIndex) = abs(pi*pi*sin(2*pi*mid_x))/( 1 + 0.25*pi*pi*cos(2*pi*mid_x)*cos(2*pi*mid_x) )^(3/2) ;

   
    
    if (vis(new_x,new_y)~=1) &&  (matrix(new_x,new_y)~=0) && (matrix(new_x,new_y)~=1)
        np = np+1;
        dfs(matrix,new_x,new_y);
    end
end
end