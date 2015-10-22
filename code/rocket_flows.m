function res = rocket_flows(~, stocks, params)
%ROCKET_FLOWS computes flows for the Thermodynamics project
    metal_energy = stocks(1);
    fuel_energies = stocks(2:length(stocks));
    num_fuel = length(fuel_energies);
    
    p = params;
    
    % Calculate variables
    fuel_mass = p.fuel_density * p.fuel_volume / p.num_coolant_stocks; %kg (per unit)
    fuel_heat_capacity = fuel_mass * p.fuel_specific_heat;
    
    metal_mass = p.metal_volume * p.metal_density;
    metal_heat_capacity = metal_mass * p.metal_specific_heat;
    
    % TODO: This should be handled in an external function
    metal_temp = metal_energy / metal_heat_capacity;
    
    %Calculate flows
    SB = 5.67e-8; %W/m2K: Stefan-Boltzman constant
    
    heat_from_exhaust = p.heat_flow_from_exhaust; % J/s
    radiative_loss = p.metal_radiative_emmisivity*SB*p.metal_surface_area * ...
        (metal_temp ^ 4 - p.air_temp^4); % J/s
    %transfer_to_coolant = p.heat_transfer_coefficient * ...
    %    p.tubing_surface_area * (metal_temp - fuel_temp); % J/s convective
    %coolant_inflow = p.fuel_flow_rate * p.fuel_density * ...
    %    (fuel_temp - p.fuel_cold_temp); % mass exchange
   
    transfers_to_fuel = zeros(num_fuel,1);
    transfers_between_fuel = zeros(num_fuel,1);
    
    for i=1:num_fuel
        if i == 1
            lastTemp = p.fuel_cold_temp;
        end
        fuel_temp = fuel_energies(i) / fuel_heat_capacity;
        transfers_to_fuel(i) = p.heat_transfer_coefficient * ...
            p.tubing_surface_area/num_fuel * (metal_temp - fuel_temp); % J/s convective

        transfers_between_fuel(i) = p.fuel_flow_rate * ...
            p.fuel_heat_capacity * p.fuel_density * ...
            (fuel_temp - lastTemp);
        lastTemp = fuel_temp;
    end
    
    res = cat(1, heat_from_exhaust - radiative_loss - sum(transfers_to_fuel),...
                transfers_to_fuel+transfers_between_fuel);
 
end

