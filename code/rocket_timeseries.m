% Define simulation parameters
p = rocket_parameters(); %Call to external definition of flow parameters
clf

% Calculate initial energy
[Times, Stocks] = simulation(p);

Times = Times / 60;

%Plot melting point
x1 = [min(Times) max(Times)];
y1 = [p.metal_melting_point p.metal_melting_point];
hold on
plot(x1, y1, 'g');

plot(Times, Stocks(:,1:p.num_coolant_stocks) - 270, 'r-');
plot(Times, Stocks(:, p.num_coolant_stocks+1:end) - 270, 'b-');
% Graph results
%clf;
%plot(Times / 60, MetalTemperatures - 270,'.');
%plot(Times / 60, FuelTemperatures - 270,'.');
title('Rocket heat flow (through fuel) simulation');
xlabel('Elapsed time (sec)');
ylabel('Temperature (°C)'); %
legend('Melting point', 'Metals',...
    'Fuel 1', 'Fuel 2', 'Fuel 3', '...');
