% Given parameters
Lx = 20e-3;
Ly = 20e-3;
P1 = 5e4;
P2 = 5e4;
nx = 101;
ny = 101;
N = 100;

P = LaplaceAnalyticalPressure(Lx, Ly, P1, P2, nx, ny, N);

figure;
pcolor(X, Y, P);
shading interp;
colorbar;
xlabel('x (m)');
ylabel('y (m)');
title('Steady-State Pressure Distribution in the Shape');