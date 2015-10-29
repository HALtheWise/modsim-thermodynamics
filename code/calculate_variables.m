function [ p ] = calculate_variables( p )
%ROCKET_CALCULATE_NONCONSTANTS Summary of this function goes here
%   Detailed explanation goes here
    p.tube_volume = pi * p.tube_radius^2 * p.tube_length * p.number_of_tubes;
    p.tubing_surface_area = p.tube_radius * 2 * pi * p.tube_length * p.number_of_tubes;
    p.fuel_heat_capacity = p.tube_volume * p.fuel_density * p.fuel_specific_heat;

    p.fuel_mass = p.fuel_density * p.tube_volume / p.num_coolant_stocks; %kg (per unit)
    p.fuel_heat_capacity = p.fuel_mass * p.fuel_specific_heat;
    
    p.metal_mass = p.metal_volume * p.metal_density / p.num_coolant_stocks; %kg (per unit);
    p.metal_heat_capacity = p.metal_mass * p.metal_specific_heat;
end