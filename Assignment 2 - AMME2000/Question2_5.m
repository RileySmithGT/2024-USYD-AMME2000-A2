function P = Question2_5(Lx, Ly, nx, ny, N, P1, P2)
    % Generate grid
    x = linspace(0, Lx, nx);
    y = linspace(0, Ly, ny);
    [X, Y] = meshgrid(x, y);

    % Compute P(x, y)
    P = zeros(ny, nx);
    for i = 1:nx
        for j = 1:ny
            xi = X(j,i);
            yj = Y(j,i);  
            % Sum Fourier terms
            for n = 1:N
                An = (8 * sin(n*pi/2)) / (n^2 * pi^2 * sinh(n*pi*Ly/Lx));
                term1 =  An * P1 * sinh((n * pi * yj) / Lx);
                term2 = -An * P2 * sinh((n * pi * (yj-Ly)) / Lx);
                P(j, i) = P(j, i) + (term1 + term2) * sin(n * pi * xi / Lx);
            end
        end
    end
end
