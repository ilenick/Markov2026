N = 1e5;                     
X = rand(N,3);
T = max(X,[],2);

% Plot histogram
histogram(T, 'Normalization', 'pdf')
hold on

% Plot actual PDF
t = linspace(0,1,500);
plot(t, 3*t.^2, 'r', 'LineWidth', 2)

title('Comparison of Simulated Trials and Theoretical PDF')
xlabel('Time past since 6pm (hours)')
ylabel('Probability density')
legend('Simulation','Theoretical PDF')