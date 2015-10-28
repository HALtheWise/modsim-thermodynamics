clf
hold on
testpoints = linspace(0.1, 0.5, 10);
testpoints2 = linspace(10, 400, 10);

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
%scatter(values)
%HeatMap(values, 'RowLabels', testpoints, 'ColumnLabels', testpoints2);
imagesc(testpoints, testpoints2, values)
colormap jet;
%plot(testpoints, MetalTemps);
%plot(testpoints, FuelTemps);

%title('Cooling effectiveness upon varying flow rates');
% xlabel('Fuel flow rate(m^3/s)');
xlabel('Number of Tubes');
%xlabel('Radius of Tubes (m)');
ylabel('Maximum temperature (K)');
legend('Metal Melting Point', 'Metal', 'Fuel');