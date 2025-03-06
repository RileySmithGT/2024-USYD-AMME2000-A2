function A = WaveAnalyticalSolution(time_points, L, T, rho, x)
    c = sqrt(T / rho); % Calculate the wave speed
    A = 0;
    % Given initial velocity coefficients
    B3 = (0.05 * L) / (3 * pi * c);
    B8 = (0.02 * L) / (8 * pi * c);
    
    % Calculate and plot displacement for each time point
    for time_index = 1:length(time_points)
        t = time_points(time_index);
        % Displacement calculation using vectorized form
        A(time_index) = B3 * sin(3 * pi * c * t/L)*sin(3 * pi * x/L)+...
            B8 * sin(8 * pi * c * t/L)*sin(8 * pi * x/L);
    end
end
