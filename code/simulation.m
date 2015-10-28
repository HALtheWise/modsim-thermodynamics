function [res1, res2] = simulation(p)
    % Calculate varying quantities
     p = rocket_calculate_vars(p);

    total_metal_heat = p.metal_density*p.metal_volume * p.metal_specific_heat * p.metal_initial_temp;
    total_fuel_heat = p.fuel_density*p.tube_volume * p.fuel_specific_heat * p.fuel_cold_temp;

    stocks(1,1:p.num_coolant_stocks) = total_metal_heat / p.num_coolant_stocks;
    stocks(1,p.num_coolant_stocks+1:2*p.num_coolant_stocks) = total_fuel_heat / p.num_coolant_stocks;

    % Run simulation
    time_span = [0 1000];
    [Times, Stocks] = ode23s(@rocket_flows, time_span, stocks, [], p);

    % Convert energies to temperatures
    Stocks(:, 1:p.num_coolant_stocks) = ...
        energy_to_temp(Stocks(:, 1:p.num_coolant_stocks), p.metal_heat_capacity);
    Stocks(:, p.num_coolant_stocks+1:2*p.num_coolant_stocks) = ...
        energy_to_temp(Stocks(:, p.num_coolant_stocks+1:2*p.num_coolant_stocks),p.fuel_heat_capacity);
    
    res1 = Times;
    res2 = Stocks;
end

