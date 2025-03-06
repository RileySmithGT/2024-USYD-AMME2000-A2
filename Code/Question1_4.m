% Given parameters
L = 50; % Length of the cable in meters
T = 5e3; % Tension in Newtons
rho = 9.86; % Linear density in kg/m
time_points=[0,1,2,3];
nx = 100;


figure;
hold on;

for time = time_points
    x = linspace(0, L, nx);
    A = WaveAnalyticalSolution(time, L, T, rho, x);
    plot(x, A, 'DisplayName', sprintf('t = %d s', time));
end

% Customize plot
xlabel('Position along the cable, x (m)');
ylabel('Displacement (m)');
title('Displacement of the Cable at Different Time Points');
legend('show');
hold off;
