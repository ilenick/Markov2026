N = 1e6;
U = rand(N,1);
X = zeros(N,1);

% Define F(x) - U = 0
F  = @(x,u) 1 - (x+1).*exp(-x) - u;
Fp = @(x) x.*exp(-x);   % derivative wrt x

tic
for i = 1:N
    u = U(i);

    % Initial guess (positive)
    x = 1;

    % Newton iterations
    for k = 1:20
        x_new = x - F(x,u)/Fp(x);

        % Enforce positivity
        if x_new <= 0
            x_new = x/2;
        end

        if abs(x_new - x) < 1e-8
            break
        end

        x = x_new;
    end

    X(i) = x;
end
runtime = toc;

fprintf('Runtime for %d samples: %.2f seconds\n', N, runtime);

figure
histogram(X, 'Normalization','pdf', 'BinLimits',[0 15])

xlabel('x')
ylabel('Density')
title('Inverse Sampling via Newton Method')

runtime_str = sprintf('Runtime: %.2f seconds', runtime);
text(9, 0.25, runtime_str, ...
     'FontSize',12,'BackgroundColor','w','EdgeColor','k');
