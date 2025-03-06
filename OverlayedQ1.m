% Define the time points for analysis
time_points = [0, 2, 4, 6];

% Create figure for plotting
figure;
hold on;

% Call the analytical solution function
Question1_4(time_points);

% Call the numerical solution function
Question1_6(time_points);

% Customize the combined plot
xlabel('Position along the cable, x (m)');
ylabel('Displacement (m)');
title('Displacement of the Cable at Different Time Points');
legend('show', 'Location', 'northeastoutside');
grid on;
hold off;
