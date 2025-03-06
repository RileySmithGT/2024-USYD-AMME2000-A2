function Ly_max = Question2_7(Lx)
    % Constants
    nx = 101; % Number of points in x
    ny = 101; % Number of points in y
    N = 100; % Number of Fourier terms
    Pressure = 5e4; % Boundary condition pressure at y=Ly
    threshold = 9.25e-4;
    % Start Ly from a small value, e.g., the width of the shape
    Ly = Lx; 
    dLy = 0.0005; % Increment for Ly (To the nearest 1/2 mm)
    
    while true
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
                for n = 1:N
                    An = (8 * sin(n*pi/2)) / (n^2 * pi^2 * sinh(n*pi*Ly/Lx));
                    term1 =  An * Pressure * sinh((n * pi * yj) / Lx);
                    term2 = -An * Pressure * sinh((n * pi * (yj-Ly)) / Lx);
                    P(j, i) = P(j, i) + (term1 + term2) * sin(n * pi * xi / Lx);
                end
            end
        end

        % Calculate average pressure at central y-axis
        mid_x_index = round(nx/2);
        P_y_avg = mean(P(:, mid_x_index));
        
        % Check the inequality
        Ix = (Lx * Ly^3) / 12;
        if Ix * P_y_avg > threshold
            break;
        end
        
        % Increment Ly
        Ly = Ly + dLy;
    end
    
    % Last valid Ly
    Ly_max = Ly - dLy;
    fprintf('Maximum Ly such that the shape does not break: %.4f m\n', Ly_max);
end
