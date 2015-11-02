%% Declaring domain for experiment

testpoints = linspace(0.1, 3, 10); % Fuel flow rate (m^3/s)
testpoints2 = linspace(100, 500, length(testpoints)); % Number of tubes

%% Calculating ODE results

values = zeros(length(testpoints), length(testpoints));
for i = 1:length(testpoints)
    
    for j = 1:length(testpoints2)
        clear Times
        clear Stocks
        p = rocket_parameters(); 
        p.fuel_flow_rate = testpoints(i);
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
contourf(testpoints, testpoints2, values, 200, 'r', ...
    'Fill', 'on', 'ShowText', 'off', 'LineWidth', 0)

[C, h] = contour(testpoints, testpoints2, values, [p.metal_melting_point, 850], 'k', ...
    'Fill', 'off', 'ShowText', 'off', 'LabelSpacing', 400,...
    'LineWidth', 1);

caxis([500, 1500]);

clabel(C, 'FontSize', 13, 'Color', 'k', 'Rotation', -87);
%colorbar
%imagesc(testpoints, testpoints2, values)
colormap jet;
%plot(testpoints, MetalTemps);
%plot(testpoints, FuelTemps);

%title('Cooling effectiveness upon varying flow rates');
% xlabel('Fuel flow rate(m^3/s)');
ylabel('Number of Tubes');
%ylim([0, 1200])
%xlim([0, 5])
%xlabel('Radius of Tubes (m)');
xlabel('Fuel flow rate (m³/s)');
%legend('Metal Melting Point', 'Metal', 'Fuel');