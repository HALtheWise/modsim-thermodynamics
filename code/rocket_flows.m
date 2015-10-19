function res = rocket_flows( stocks, params )
%COFFEE_FLOWS computes flows for coffee problem in Exercise Set 5
    metal_energy = stocks(1);
    fuel_energy = stocks(2);
    
    p = params;
    
    % Calculate variables
    fuel_mass = p.fuel_density * p.fuel_volume; %kg
    fuel_heat_capacity = fuel_mass * p.fuelspecific_heat; 
    
    metal_heat_capacity = p.metal_mass * p.metal_specific_heat;
    
    fuel_temp = fuel_energy / heat_capacity;
    metal_temp = metal_energy / heat_capacity;
    
    % Export coffe_temp
    global FuelTemperatures;
    FuelTemperatures(length(FuelTemperatures)+1) = fuel_temp;
    global MetalTemperatures;
    MetalTemperatures(length(MetalTemperatures)+1) = metal_temp;
    
    %Calculate flows
    radiative_input = !!!(p.cup_cond*conduction_area/p.cup_t)*(coffee_temp-p.env_temp);
    convective_loss = !!!p.convective_heat_transfer_coeff*convection_area*(coffee_temp-p.env_temp);
   
    res = [-radiative_input - convective_loss];
end

