Pan=Question2_5;
Pnum = Question2_6(0.02,0.02,101,101, 100, 5e4, 5e4);
   x = linspace(0, Lx, nx);

Pdiff=Pan-Pnum;

    [X, Y] = meshgrid(x, linspace(0, Ly, ny));
    figure;
    pcolor(X, Y, Pdiff);
    shading interp;
    colorbar;
    title('Numerical Solution with Triangular Boundary Conditions');
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('Pressure (Pa)');