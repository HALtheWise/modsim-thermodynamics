% Define simulation parameters
rocket_parameters; %Call to external definition of flow parameters

initial_temperature = p.air_temp; % K

% Calculate initial energy
metal_heat = p.metal_density*p.metal_volume * p.metal_specific_heat * p.metal_initial_temp;
total_fuel_heat = p.fuel_density*p.fuel_volume * p.fuel_specific_heat * p.fuel_cold_temp;
stocks = metal_heat;
stocks(1,2:p.num_coolant_stocks+1) = total_fuel_heat / p.num_coolant_stocks;
disp(stocks)

% Run simulation
time_span = [0 200];
[Times, Stocks] = ode45(@rocket_flows, time_span, stocks, [], p);

for i=1:size(Stocks)
    Stocks(i, 1) = energy_to_temp(Stocks(i, 1), p.metal_specific_heat * p.metal_volume * p.metal_density);
    Stocks(i, 2:end) = energy_to_temp(Stocks(i, 2:end), p.fuel_specific_heat * p.fuel_volume * p.fuel_density / p.num_coolant_stocks);
end

plot(Times, Stocks);
% Graph results
%clf;
%plot(Times / 60, MetalTemperatures - 270,'.');
%plot(Times / 60, FuelTemperatures - 270,'.');
title('Rocket heat flow (through fuel) simulation');
xlabel('Elapsed time (sec)');
ylabel('Temperature (°C)'); %
%legend('Metal', 'Fuel');
