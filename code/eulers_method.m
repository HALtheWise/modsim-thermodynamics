function [Times, Stocks]=eulers_method(initial_stocks, net_flows, params, simDuration, timeStep)
%   eulers_method(initial_stocks, net_flows, params, simDuration, timeStep)
%   This function takes a function handle @net_flows and simulates it over
%   simDuration with resolution timeStep. The result is graphed.
    
    n = length(initial_stocks);

    Times = linspace(0, simDuration, ceil(simDuration / timeStep) + 1);
    
    Stocks = zeros(length(Times), length(initial_stocks));
    Stocks(1, 1:n) = initial_stocks;
    
    for i = 2:length(Times)
        dt = Times(i) - Times(i-1); % timestep length, in [years]
        
        % Define flows
        Net_flows = net_flows(Stocks(i-1, 1:n), params);
        
        % Apply various flows to stocks
        Stocks(i, 1:n) = Stocks(i-1, 1:n) + dt * Net_flows;
    end
    
    clf;
    hold on;
    for i = 1:n
        plot(Times, Stocks(:,i), '.');
    end
    
end