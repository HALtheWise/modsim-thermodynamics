% Define simulation parameters
p = rocket_parameters(); %Call to external definition of flow parameters

p.number_of_tubes = 900;
p.fuel_flow_rate = 0.21;
clf

% Calculate initial energy
[Times, Stocks] = simulation(p);

Times = Times / 60;

%Plot melting point
x1 = [min(Times) max(Times)];
y1 = [p.metal_melting_point p.metal_melting_point];
hold on
melting_line = plot(x1, y1, 'g');

fuel_lines = plot(Times, Stocks(:, p.num_coolant_stocks+1:end), 'b-');
metal_lines = plot(Times, Stocks(:,1:p.num_coolant_stocks), 'r-');



title('Rocket heat flow simulation');
xlabel('Elapsed time (minutes)');
ylabel('Temperature (K)'); %
legend([melting_line, metal_lines(1), fuel_lines(1)], 'Melting point', ...
    'Metal temperatures','Fuel temperatures');
