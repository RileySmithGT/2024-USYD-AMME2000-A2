% Temporal (t) parameters                           
max_time = 60;
nt = 61;
time = linspace(0, max_time, nt);

% Initialization
Q0 = 1;  % Normalization factor for charge
a_values = [0.025, 0.05, 0.1, 0.2];  % Different 'a' scenarios

% Prepare figure for plotting
figure;
hold on;
grid on;
legendEntries = strings(1, length(a_values));

% Computing and plotting Q(0,t) for each 'a'
for i = 1:length(a_values)
    a = a_values(i);
    Q_t = zeros(1, nt);  % Initialize Q_t array
    for n = 1:nt
        Q_t(n) = 0.5 * (erf((a + 0) / (2 * sqrt(3e-4 * time(n)))) + erf((a - 0) / (2 * sqrt(D * time(n)))));
    end
    plot(time, Q_t / Q0, 'DisplayName', sprintf('a = %.3f m', a));
    legendEntries(i) = sprintf('a = %.3f m', a);
end

% Customize the plot
xlabel('Time (s)');
ylabel('Q(0,t) / Q0');
title('Normalized Charge at Center Over Time for Different a values');
legend(legendEntries, 'Location', 'best');
hold off;
