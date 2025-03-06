function [x, t, u] = WaveNumericalSolution(tf, nx, L, T, rho)
% WaveNumericalSolution - Numerical solution to the wave equation
% with a forcing term using the CTCS scheme
% Input :
%    tf - end time for the solution [s]
%    nx - number of points in the spatial domain
%    L - Length of the cable [m]
%    T - Tension [N]
%    rho - Linear density [kg/m]
% Output :
%    x - x-domain points [m]
%    t - time domain points [s]
%    u - matrix of displacement values, row n is solution at timestep n [m]

% Wave speed [m/s]
c = sqrt(T / rho);

% Generate domain
dx = L / (nx - 1);        % x-domain spacing [m]
x = linspace(0, L, nx);   % x-domain [m]
dt = dx / c;              % Timestep [s]
nt = ceil(tf / dt + 1);   % Number of timesteps
t = 0:dt:tf;              % Time domain [s]

% Coefficient in CTCS scheme
sigma = (dt * c / dx)^2;

% Initialize solution array
u = zeros(nt, nx);

% Initial velocity profile
v = 0.05 * sin(3 * pi * x / L) + 0.02 * sin(8 * pi * x / L);

% Solution for the first timestep using the initial velocity
for i = 2:nx-1
    F = 0.14 * cos(2 * pi * 540 * dt * 0) * sin(2 * pi * dx * (i) / L);
    u(2, i) = u(1, i) + dt * v(i) + 0.5 * sigma * (u(1, i+1) - 2 * u(1, i) + u(1, i-1)) + (dt^2 / rho) * F;
end
u(2, 1) = 0; u(2, nx) = 0; % Boundary conditions

% Solution for the remaining timesteps
for n = 2:nt-1
    for i = 2:nx-1
        F = 0.14 * cos(2 * pi * 540 * dt * n) * sin(2 * pi * dx * (i) / L);
        u(n+1, i) = 2 * u(n, i) - u(n-1, i) + sigma * (u(n, i+1) - 2 * u(n, i) + u(n, i-1)) + (dt^2 / rho) * F;
    end
    u(n+1, 1) = 0; u(n+1, nx) = 0; % Boundary conditions
end

% Plotting
figure;

xlabel('Position along the cable, x (m)');
ylabel('Time (s)');
title('Displacement of the Cable Over Time');
colorbar;

end
