% Define simulation parameters
rocket_parameters; %Call to external definition of flow parameters
params = p;
clear('p')

initial_temperature = 300; % K

% Calculate initial energy
stocks = pi*(params.cup_d/2)^2*params.cup_h * params.coffee_dens * params.coffee_spheat * initial_temperature;

% Create extra tracking for Temperature
global MetalTemperatures;
MetalTemperatures = initial_temperature;
global FuelTemperatures;
FuelTemperatures = initial_temperature;

% Run simulation
[Times, Stocks] = eulers_method(stocks, @rocket_flows, params, 30*60, 2);

% Graph results
clf;
plot(Times / 60, MetalTemperatures - 270,'.');
plot(Times / 60, FuelTemperatures - 270,'.');
title('Rocket heat flow (through fuel) simulation');
xlabel('Elapsed time (minutes)');
ylabel('Temperature (°C)');