function res = rocket_flows(~, stocks, params)
%ROCKET_FLOWS computes flows for the Thermodynamics project
    p = params;
    num_fuel = p.num_coolant_stocks;
    
    
    metal_energies = stocks(1:num_fuel);
    fuel_energies = stocks(num_fuel+1:2*num_fuel);
    
    
    % Calculate variables
    
    %Calculate flows
    SB = 5.67e-8; %W/m2K: Stefan-Boltzman constant
    
    %transfer_to_coolant = p.heat_transfer_coefficient * ...
    %    p.tubing_surface_area * (metal_temp - fuel_temp); % J/s convective
    %coolant_inflow = p.fuel_flow_rate * p.fuel_density * ...
    %    (fuel_temp - p.fuel_cold_temp); % mass exchange
    
    transfers_to_metal(1:num_fuel,1) = p.heat_flow_from_exhaust / num_fuel;
    radiations_from_metal = zeros(num_fuel,1);
    transfers_to_fuel = zeros(num_fuel,1);
    transfers_between_fuel = zeros(num_fuel,1);
    
    for i=1:num_fuel
        if i == 1
            last_fuel_temp = p.fuel_cold_temp;
        end
        metal_temp = metal_energies(i) / p.metal_heat_capacity;
        
        radiations_from_metal(i) = p.metal_radiative_emmisivity*SB*...
            (p.metal_surface_area / num_fuel) * ...
            (metal_temp ^ 4 - p.air_temp^4); % J/s radiative
        
        fuel_temp = fuel_energies(i) / p.fuel_heat_capacity;
        
        transfers_to_fuel(i) = p.heat_transfer_coefficient * ...
            (p.tubing_surface_area/num_fuel) * (metal_temp - fuel_temp); % J/s convective

        transfers_between_fuel(i) = p.fuel_flow_rate * ...
            p.fuel_specific_heat * p.fuel_density * ...
            (fuel_temp - last_fuel_temp);
        last_fuel_temp = fuel_temp;
    end
    
    res (1:num_fuel, 1) = transfers_to_metal - radiations_from_metal - transfers_to_fuel;
    res (num_fuel+1 : 2*num_fuel, 1) = transfers_to_fuel - transfers_between_fuel;
    
    %res = cat(1, heat_from_exhaust - radiative_loss - sum(transfers_to_fuel),...
    %            transfers_to_fuel-transfers_between_fuel);
 
end

