clf
hold on
testpoints = linspace(1, 1000, 30);

MetalTemps = zeros(1, length(testpoints));
FuelTemps = zeros(1, length(testpoints));

for i = 1:length(testpoints)
    testpt = testpoints(i);
    p = rocket_parameters();
    
    % Alter initial conditions
%     p.fuel_flow_rate = testpt;
     p.number_of_tubes = testpt;
%    p.tube_radius = testpt;
    
    [Times, Stocks] = simulation(p);
    [MetalTemps(i), FuelTemps(i)] = important_values(Stocks);
end

plot(testpoints, MetalTemps);
plot(testpoints, FuelTemps);

title('Cooling effectiveness upon varying flow rates');
% xlabel('Fuel flow rate(m^3/s)');
xlabel('Number of Tubes');
%xlabel('Radius of Tubes (m)');
ylabel('Maximum temperature (K)');
legend('Metal', 'Fuel');