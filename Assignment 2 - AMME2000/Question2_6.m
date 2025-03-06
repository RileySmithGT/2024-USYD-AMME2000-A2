function P = Question2_6(Lx, Ly, nx, ny, N, P1, P2)
    P = zeros(ny, nx); % Initial guess
    % Set the x-axis grid
    x = linspace(0, Lx, nx);

    % Boundary conditions
    peakIndex = round(nx / 2);
    for i = 1:nx
        if i <= peakIndex
            P(1, i) = P2 * (i-1) / (peakIndex-1);
            P(end, i) = P1 * (i-1) / (peakIndex-1);
        else
            P(1, i) = P2 * (nx-i) / (nx-peakIndex);
            P(end, i) = P1 * (nx-i) / (nx-peakIndex);
        end
    end

    err = 1;a
    tol = 1e-10; % Tolerance for convergence
    while err > tol
        P_old = P; % Store the previous values
        for j = 2:ny-1
            for i = 2:nx-1
                P(j, i) = 0.25 * (P_old(j+1, i) + P_old(j-1, i) + P_old(j, i+1) + P_old(j, i-1));
            end
        end
        err = max(max(abs(P - P_old)));
    end
end
