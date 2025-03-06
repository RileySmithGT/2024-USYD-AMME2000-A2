% Given parameters
L = 50; % Length of the cable in meters
T = 5e3; % Tension in Newtons
rho = 9.86; % Linear density in kg/m
time_points = 0:0.1:10; % Time points from 0 to 10 seconds in increments of 0.1 second
positions = [15, 20, 45]; % Positions along the cable to plot

% Calculate displacement using the analytical solution
displacements = zeros(length(time_points), length(positions));
x = positions;

for i = 1:length(positions)
    displacements(:, i) = WaveAnalyticalSolution(time_points, L, T, rho, positions(i));
end

% Plotting
figure;
hold on;

% Plot displacement at specified positions as a function of time
for i = 1:length(positions)
    plot(time_points, displacements(:, i), 'DisplayName', sprintf('x = %d m', positions(i)));
end

% Customize plot
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Displacement of the Cable at Different Positions Over Time');
legend('show');
grid on;
hold off;