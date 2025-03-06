% Given Parameters
Lx = 0.02;
Ly = 0.02;
P1 = 5e4;
P2 = 5e4;
nx = 101;
ny = 101;
N = 100;

% Call functions
P_2_5 = LaplaceAnalyticalPressure(Lx, Ly, P1, P2, nx, ny, N);
P_2_6 = LaplaceNumericalPressure(Lx, Ly, P1, P2, nx, ny, N);

% Generate grid
x = linspace(0, Lx, nx);
y = linspace(0, Ly, ny);
[X, Y] = meshgrid(x, y);

% Create subplots
figure;

% Subplot for Numerical Solution
subplot(1, 2, 1);
pcolor(X, Y, P_2_6);
shading interp;
colorbar;
xlabel('x (m)');
ylabel('y (m)');
title('Numerical Steady-State Pressure Distribution');

% Subplot for I diff
subplot(1, 2, 2);
pcolor(X, Y, P_2_6-P_2_5);
shading interp;
colorbar;
xlabel('x (m)');
ylabel('y (m)');
title('Analytical - Numerical Solution');