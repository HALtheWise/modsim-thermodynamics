% Define simulation parameters
clf
rocket_parameters; %Call to external definition of flow parameters

initial_temperature = p.air_temp; % K

% Calculate initial energy
[Times, Stocks] = simulation(p);

x1 = [0 1000];
y1 = [p.metal_melting_point p.metal_melting_point];
hold on
plot(x1, y1);

plot(Times, Stocks);
% Graph results
%clf;
%plot(Times / 60, MetalTemperatures - 270,'.');
%plot(Times / 60, FuelTemperatures - 270,'.');
title('Rocket heat flow (through fuel) simulation');
xlabel('Elapsed time (sec)');
ylabel('Temperature (°C)'); %
legend('Fuel 1', 'Fuel 2', '...', '', '');
