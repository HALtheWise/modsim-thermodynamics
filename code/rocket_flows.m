function res = rocket_flows( stocks, params )
%COFFEE_FLOWS computes flows for coffee problem in Exercise Set 5
    metal_energy = stocks(1);
    fuel_energy = stocks(2);
    
    p = params;
    
    % Calculate variables
    fuel_mass = p.fuel_density * p.fuel_volume; %kg
    fuel_heat_capacity = fuel_mass * p.fuelspecific_heat;
    
    metal_mass = p.mnetal_volume * p.metal_density;
    metal_heat_capacity = metal_mass * p.metal_specific_heat;
    
    % TODO: This should be handled in an external function
    fuel_temp = fuel_energy / fuel_heat_capacity;
    metal_temp = metal_energy / metal_heat_capacity;
    
    % Export coffe_temp
    global FuelTemperatures;
    FuelTemperatures(length(FuelTemperatures)+1) = fuel_temp;
    global MetalTemperatures;
    MetalTemperatures(length(MetalTemperatures)+1) = metal_temp;
    
    %Calculate flows
    SB = 5.67e-8; %W/m2K
    
    heat_from_exhaust = p.heat_flow_from_exhaust; % J/s
    radiative_loss = p.metal_radiative_emmisivity*SB*p.metal_surface_area * ...
        (metal_temp ^ 4 - p.air_temp^4); % J/s
    transfer_to_coolant = p.heat_transfer_coefficient * ...
        p.tubing_surface_area * (fuel_temp - metal_temp); % J/s convective
    coolant_inflow = p.fuel_flow_rate * p.fuel_density * ...
        (fuel_temp - p.fuel_cold_temp); % mass exchange
   
    %TODO: this needs to become a column vector for ode45 compatibility
    res = [heat_from_exhaust - radiative_loss - transfer_to_coolant,
            transfer_to_coolant - coolant_inflow];
end

