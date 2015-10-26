function [res1, res2] = important_values(Stocks)
    max_metal_temp = max(Stocks(:,1));
    max_fuel_temp = max(Stocks(:,length(Stocks)));
    res1 = max_metal_temp;
    res2 = max_fuel_temp;
end