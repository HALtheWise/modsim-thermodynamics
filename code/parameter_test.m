function [ max_metal_temp ] = parameter_test( tubeNum, flowRate )
%PARAMETER_TEST Summary of this function goes here
%   Detailed explanation goes here
    p = rocket_parameters(); 
    p.fuel_flow_rate = flowRate;
    p.number_of_tubes = tubeNum;
    [~, Stocks] = simulation(p);
    [max_metal_temp, ~] = important_values(Stocks);

end

