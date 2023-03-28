load('data_sine_wave_left_to_right_order.mat');
volumeFraction = volumeFraction';
cur = cur';
cur = cur/100;


% Define net function
load('./results/150/additional_data/net.mat');

% Calculate output values
output = net(volumeFraction);
output = abs(output);


% Plot parity plot
figure;
scatter(cur, output);
hold on;
plot(output, output);
xlabel('Target');
ylabel('Output');
title('Parity plot: Target vs. Output');

y = zeros(1000);
x = zeros(1000);

for i=1:1000
    mid_x = i/1000;
    x(i) = i/1000;
   y(i) = (pi*pi*sin(2*pi*mid_x))/( 1 + 0.25*pi*pi*cos(2*pi*mid_x)*cos(2*pi*mid_x) )^(3/2) ;
end

figure(2);
plot(x,y);

