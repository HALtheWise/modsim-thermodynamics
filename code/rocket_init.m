% Define simulation parameters
rocket_parameters; %Call to external definition of flow parameters
params = p;

initial_temperature = 300; % K

% Calculate initial energy
metal_heat = p.metal_density*p.metal_volume * p.metal_specific_heat * p.metal_initial_temp;
fuel_heat = p.fuel_density*p.fuel_volume * p.fuel_specific_heat * p.fuel_cold_temp;
stocks = [metal_heat, fuel_heat];
clear('p')

% Create extra tracking for Temperature
global MetalTemperatures;
MetalTemperatures = initial_temperature;
global FuelTemperatures;
FuelTemperatures = initial_temperature;

% Run simulation
[Times, Stocks] = eulers_method(stocks, @rocket_flows, params, 60, 5);

% Graph results
clf;
plot(Times / 60, MetalTemperatures - 270,'.');
plot(Times / 60, FuelTemperatures - 270,'.');
title('Rocket heat flow (through fuel) simulation');
xlabel('Elapsed time (minutes)');
ylabel('Temperature (°C)');
legend('Metal', 'Fuel');