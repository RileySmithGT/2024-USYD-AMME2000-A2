% Given parameters
L = 50; % Length of the cable in meters
T = 5e3; % Tension in Newtons
rho = 9.86; % Linear density in kg/m
time_points = [0, 1, 2, 3]; % Time points to plot
nx = 101; % Number of spatial points
tf = max(time_points); % End time for the solution

% Call the WaveNumericalSolution function
[x, t, u] = WaveNumericalSolution(tf, nx, L, T, rho);

% Plotting
figure;
hold on;

for time = time_points
    x = linspace(0, L, nx);
    A = WaveAnalyticalSolution(time, L, T, rho, x);
    plot(x, A, 'DisplayName', sprintf('Analytical: t = %d s', time));
end

% Plot numerical solutions for different time points
for k = 1:length(time_points)
    time_index = round(time_points(k) / (tf / (length(t)-1))) + 1;
    plot(x, u(time_index, :), 'DisplayName', sprintf('Numerical: t = %d s', time_points(k)));
end

% Customize plot
legend('Location','bestoutside')
xlabel('Position along the cable, x (m)');
ylabel('Displacement (m)');
title('Displacement of the Cable at Different Time Points');
legend('show');
hold off;