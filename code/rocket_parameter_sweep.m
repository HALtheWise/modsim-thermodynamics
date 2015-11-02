%% Declaring domain for experiment

testpoints = linspace(.1, 3, 10); % Fuel flow rate (m^3/s)
testpoints2 = linspace(100, 1000, 10); % Number of tubes

%% Calculating ODE results

values = zeros(length(testpoints), length(testpoints2));
for i = 1:length(testpoints)
    
    for j = 1:length(testpoints2)
        
        values(i,j) = parameter_test(testpoints2(j), testpoints(i));
        
    end
end
%% Plotting results

clf
hold on
%scatter(values)
%HeatMap(values, 'RowLabels', testpoints, 'ColumnLabels', testpoints2);
%figure
caxis([500, 1500]);

contourf(testpoints, testpoints2, values', 200, 'r', ...
    'Fill', 'on', 'ShowText', 'off', 'LineWidth', 0)
    
p = rocket_parameters();
[C, h] = contour(testpoints, testpoints2, values', [p.metal_melting_point, 850], 'k', ...
   'Fill', 'off', 'ShowText', 'off', 'LabelSpacing', 400,...
   'LineWidth', 1);


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
title('Rocket cooling behavior');
%legend('Metal Melting Point', 'Metal', 'Fuel');