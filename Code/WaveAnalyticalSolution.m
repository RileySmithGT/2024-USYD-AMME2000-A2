function A = WaveAnalyticalSolution(time, L, T, rho, x)
    c = sqrt(T / rho); % Calculate the wave speed
    % Given initial velocity coefficients
    B3 = (0.05 * L) / (3 * pi * c);
    B8 = (0.02 * L) / (8 * pi * c);
    
    % Calculate displacement using element-wise operations
    A = B3 * sin(3 * pi * c * time/L) .* sin(3 * pi * x/L) + ...
        B8 * sin(8 * pi * c * time/L) .* sin(8 * pi * x/L);
end
