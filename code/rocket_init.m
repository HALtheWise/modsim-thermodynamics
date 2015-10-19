% Define simulation parameters
rocket_parameters; %Call to external definition of flow parameters
params = p;

initial_temperature = 300; % K

% Calculate initial energy
metal_heat = p.metal_density*p.metal_volume * p.metal_specific_heat * p.metal_initial_temp;
total_fuel_heat = p.fuel_density*p.fuel_volume * p.fuel_specific_heat * p.fuel_cold_temp;
stocks(1) = metal_heat;
stocks(2:p.num_coolant_stocks+1) = total_fuel_heat / p.num_coolant_stocks;
disp(stocks)
clear('p')

% Create extra tracking for Temperature
global MetalTemperatures;
MetalTemperatures = initial_temperature;
global FuelTemperatures;
FuelTemperatures = initial_temperature;

% Run simulation
time_span = [0 100];
[Times, Stocks] = ode45(@rocket_flows, time_span, stocks, [], params);

plot(Times, Stocks);
% Graph results
%clf;
%plot(Times / 60, MetalTemperatures - 270,'.');
%plot(Times / 60, FuelTemperatures - 270,'.');
title('Rocket heat flow (through fuel) simulation');
xlabel('Elapsed time (sec)');
ylabel('Temperature (°C)');
legend('Metal', 'Fuel');