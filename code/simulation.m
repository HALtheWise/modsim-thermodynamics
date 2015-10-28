function [res1, res2] = simulation(p)
    % Calculate varying quantities
    p.tube_volume = pi * p.tube_radius^2 * p.tube_length * p.number_of_tubes;
    p.tubing_surface_area = p.tube_radius * 2 * pi * p.tube_length * p.number_of_tubes;
    p.fuel_heat_capacity = p.tube_volume * p.fuel_density * p.fuel_specific_heat;


    metal_heat = p.metal_density*p.metal_volume * p.metal_specific_heat * p.metal_initial_temp;
    total_fuel_heat = p.fuel_density*p.tube_volume * p.fuel_specific_heat * p.fuel_cold_temp;

    stocks = metal_heat;
    stocks(1,2:p.num_coolant_stocks+1) = total_fuel_heat / p.num_coolant_stocks;

    % Run simulation
    time_span = [0 1000];
    [Times, Stocks] = ode23s(@rocket_flows, time_span, stocks, [], p);

    % Convert energies to temperatures
    Stocks(:, 1) = energy_to_temp(Stocks(:, 1), p.metal_specific_heat * p.metal_volume * p.metal_density);
    Stocks(:, 2:end) = energy_to_temp(Stocks(:, 2:end), p.fuel_specific_heat * p.tube_volume * p.fuel_density / p.num_coolant_stocks);
    
    res1 = Times;
    res2 = Stocks;
end

