% rocket.m

p.air_temp = 290;

p.fuel_heat_capacity = ;
p.fuel_specific_heat = 15000; % paper
p.fuel_cold_temp = 91.7; % paper
p.fuel_temp = ;
p.fuel_mass = ;
p.fuel_volume = ;
p.fuel_density = 71.0; % paper

p.metal_heat_capacity = p.metal_mass * p.metal_specific_heat;
p.metal_specific_heat = 450; % paper (copper)
p.metal_initial_temp = 290; 
p.metal_volume = 0.84 * pi;
p.metal_surface_area = 8 * pi;
p.metal_density = 8890; % paper
p.metal_mass = p.mnetal_volume * p.metal_density;

p.tubing_surface_area = 8 * pi;

p.conductivity_metal_fuel = ;

