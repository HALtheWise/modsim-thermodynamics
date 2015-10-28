function [max_metal_temp, max_fuel_temp] = important_values(Stocks)
    max_metal_temp = max(Stocks(:,end/2));
    max_fuel_temp = max(Stocks(:,end));
end