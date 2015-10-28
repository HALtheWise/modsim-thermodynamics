function res = rocket_parameters()
    p.air_temp = 290;

    p.chamber_length = 1; % meter
    
    p.metal_specific_heat = 450; % paper (copper)
    p.metal_initial_temp = 290; 
    p.metal_volume = 0.84 * pi; % m^3
    p.metal_surface_area = 8 * pi; % m^2
    p.metal_density = 8890; % paper
    p.metal_radiative_emmisivity = 0.02; %copper (unoxidized)
    p.metal_melting_point = 1053;

    p.number_of_tubes = 300;
    p.tube_radius = .5 * 1e-2; %cm, converted to m
    p.tube_length = p.chamber_length; %meter
    p.tube_volume = pi * p.tube_radius^2 * p.tube_length * p.number_of_tubes;
    p.tubing_surface_area = p.tube_radius * 2 * pi * p.tube_length * p.number_of_tubes;

    p.fuel_specific_heat = 15000; % J / kg paper % Coolant is liquid hydrogen
    p.fuel_cold_temp = 91.7; % K, paper
    p.fuel_density = 71; % kg / m^3 paper
    p.fuel_heat_capacity = p.tube_volume * p.fuel_density * p.fuel_specific_heat;

    p.heat_transfer_coefficient = 12000; %math behind this is extremely complex, this is the value of heat transfer coefficient for water flowing in tubes

    p.heat_flow_from_exhaust = 100000000;

    p.fuel_flow_rate = 0.3; %m^3/s

    p.num_coolant_stocks = 50;
    
    res = p;
end