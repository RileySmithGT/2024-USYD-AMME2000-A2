% Given parameters
L = 50; % Length of the cable in meters
T = 5e3; % Tension in Newtons
rho = 9.86; % Linear density in kg/m
time_points = 0:0.1:100; % Time points from 0 to 100 seconds in increments of 0.1 second
nx = 101; % Number of spatial points
positions = linspace(0, L, nx); % Positions along the cable

% Calculate displacement using the analytical solution
displacements = zeros(length(time_points), length(positions));
for i = 1:length(positions)
    displacements(:, i) = WaveAnalyticalSolution(time_points, L, T, rho, positions(i));
end

% Find maximum displacement over the entire time period at any position
[max_displacement, max_index] = max(displacements(:));
[max_time_index, max_pos_index] = ind2sub(size(displacements), max_index);

max_time = time_points(max_time_index);
max_position = positions(max_pos_index);

% Display the maximum displacement and its position and time
fprintf('Maximum displacement is %.4f m at position x = %.2f m and time t = %.2f s\n', max_displacement, max_position, max_time);
