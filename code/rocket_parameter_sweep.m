clf
testpoints = linspace(0.1 * 1e-3, 10 * 1e-3, 10);

MetalTemps = zeros(1, length(testpoints));
FuelTemps = zeros(1, length(testpoints));

for i = 1:length(testpoints)
    testpt = testpoints(i);
    p = rocket_parameters();
    p.fuel_flow_rate = testpt;
    
    [Times, Stocks] = simulation(p);
    [MetalTemps(i), FuelTemps(i)] = important_values(Stocks);
end

plot(testpoints, MetalTemps);
plot(testpoints, FuelTemps);

xlabel('Fuel flow rate(m^3/s)');
ylabel('Maximum temperature (K)');
legend(['Metal', 'Fuel']);