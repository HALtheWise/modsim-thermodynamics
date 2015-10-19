% rocket.m

p.air_temp = 290;

p.fuel_heat_capacity = ;
p.fuel_specific_heat = 15000; % paper
p.fuel_cold_temp = 91.7; % K, paper
p.fuel_volume = ;
p.fuel_density = 71.0; % paper

p.metal_specific_heat = 450; % paper (copper)
p.metal_initial_temp = 290; 
p.metal_volume = 0.84 * pi;
p.metal_surface_area = 8 * pi;
p.metal_density = 8890; % paper
p.metal_radiative_emmisivity = ; %need value for metal

p.tubing_surface_area = 8 * pi;

p.heat_transfer_coefficient = 3000; %complete guess

p.heat_flow_from_exhaust = ;

p.fuel_flow_rate = ; %m^3/s
