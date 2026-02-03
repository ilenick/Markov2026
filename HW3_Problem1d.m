x = linspace(0, 10, 1000);
a = sqrt(3) - 1;

c = exp(-a) / (3*a^2 - 3*a^3);

% Functions
f = (1/3) .* x .* (1 + x) .* exp(-x);
g_scaled = c .* (a^2 .* x .* exp(-a .* x));

% Plot it
figure
plot(x, f, 'LineWidth', 2)
hold on
plot(x, g_scaled, 'LineWidth', 2)
xlabel('x')
ylabel('Function Value')
title('Acceptance Rejection Plots')
legend('f(x)', ...
       'c(a)*g_a(x)')

grid on
axis tight
hold off
