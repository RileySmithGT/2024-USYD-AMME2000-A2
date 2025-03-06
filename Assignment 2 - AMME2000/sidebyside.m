% Given parameters
L = 50; % Length of the cable in meters
T = 5e3; % Tension in Newtons
rho = 9.86; % Linear density in kg/m
nx = 101; % Number of spatial points
tf = 100; % End time for the solution

% Call the WaveNumericalSolution function and plot the results
[x, t, u] = WaveNumericalSolution(tf, nx, L, T, rho);
