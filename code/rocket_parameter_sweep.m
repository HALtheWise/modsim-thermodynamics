%% Declaring domain for experiment

testpoints = linspace(0.1, 3.0, 20); % Fuel flow rate (m^3/s)
testpoints2 = linspace(100, 500, 20); % Number of tubes

%% Calculating ODE results

MetalTemps = zeros(1, length(testpoints));
FuelTemps = zeros(1, length(testpoints));

values = [1:length(testpoints); 1:length(testpoints2)];
for i = 1:length(testpoints)
    p = rocket_parameters(); 
    p.fuel_flow_rate = testpoints(i);
    
    for j = 1:length(testpoints2)
        p.number_of_tubes = testpoints2(j);
        [Times, Stocks] = simulation(p);
        [values(i, j), ~] = important_values(Stocks);
    end
end
%% Plotting results

clf
hold on
%scatter(values)
%HeatMap(values, 'RowLabels', testpoints, 'ColumnLabels', testpoints2);
%figure
contourf(testpoints, testpoints2, values, 100, 'r', ...
    'Fill', 'on', 'ShowText', 'off', 'LineWidth', 0)

contour(testpoints, testpoints2, values, [p.metal_melting_point, p.metal_melting_point * 0.8], 'w', ...
    'Fill', 'off', 'ShowText', 'on', 'LabelSpacing', 400,...
    'LineWidth', 1)
%colorbar
%imagesc(testpoints, testpoints2, values)
colormap jet;
%plot(testpoints, MetalTemps);
%plot(testpoints, FuelTemps);

%title('Cooling effectiveness upon varying flow rates');
% xlabel('Fuel flow rate(m^3/s)');
ylabel('Number of Tubes');
%xlabel('Radius of Tubes (m)');
xlabel('Fuel flow rate (m³/s)');
%legend('Metal Melting Point', 'Metal', 'Fuel');