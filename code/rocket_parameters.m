% rocket.m

p.air_temp = 290;

p.fuel_specific_heat = 15000; % paper
p.fuel_cold_temp = 91.7; % K, paper
p.fuel_volume = 1; 
p.fuel_density = 0.710; % 
p.fuel_heat_capacity = p.fuel_volume * p.fuel_density * p.fuel_specific_heat;

p.metal_specific_heat = 450; % paper (copper)
p.metal_initial_temp = 290; 
p.metal_volume = 0.84 * pi;
p.metal_surface_area = 8 * pi;
p.metal_density = 8890; % paper
p.metal_radiative_emmisivity = 0.02; %copper (unoxidized)

p.tube_volume = p.fuel_volume;
p.number_of_tubes = 32;
p.tube_radius = sqrt(p.tube_volume / p.number_of_tubes / pi);
p.tubing_surface_area = p.tube_radius * 2 * pi * p.number_of_tubes;

p.heat_transfer_coefficient = 1200; %math behind this is extremely complex, this is the value of heat transfer coefficient for water flowing in tubes

p.heat_flow_from_exhaust = 100000000;

p.fuel_flow_rate = 0.01; %m^3/s

p.num_coolant_stocks = 5;