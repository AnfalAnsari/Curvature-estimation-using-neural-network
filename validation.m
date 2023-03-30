load('data_sine_wave.mat');
volumeFraction = volumeFraction';
middleX = middleX';
cur = cur';
cur = cur;


% Define net function
load('./results/150/negative_values/net.mat');

% Calculate output values
output = net(volumeFraction);
output = output*100;



% Analytical v/s predicted value of curvature
y = zeros(1000);
x = zeros(1000);

for i=1:1000
    mid_x = i/1000;
    x(i) = i/1000;
   y(i) = (pi*pi*sin(2*pi*mid_x))/( 1 + 0.25*pi*pi*cos(2*pi*mid_x)*cos(2*pi*mid_x) )^(3/2) ;
end

figure(2);
xlabel('x');
ylabel('curvature');
plot(x,y);
hold on;
scatter(middleX,output);




% Plot parity plot
output = abs(output);
figure;
scatter(cur, output);
hold on;
plot(output, output);
xlabel('Target');
ylabel('Output');
title('Parity plot: Target vs. Output');



