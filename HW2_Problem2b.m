N = 1e6;
U = rand(N,1);
X = zeros(N,1);

% Define F(x) - U = 0
F = @(x,u) 1 - (x+1).*exp(-x) - u;
% derivative of F wrt x
Fp = @(x) x.*exp(-x);

tic
for i = 1:N
    u = U(i);

    % Initial guess (positive)
    x = 1;   % works well for Gamma(2,1)

    % Newton iterations
    for k = 1:20
        x_new = x - F(x,u)/Fp(x);
        %Positive roots
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


%plot it
xgrid = linspace(0,15,1000);
pdf_theory = xgrid.*exp(-xgrid);

figure
histogram(X, 'Normalization','pdf', 'BinLimits',[0 15])
hold on
plot(xgrid, pdf_theory, 'LineWidth',2)
hold off

xlabel('x')
ylabel('Density')
title('Inverse Sampling via Newton Method')

runtime_str = sprintf('Runtime: %.2f seconds', runtime);
text(9, 0.25, runtime_str, ...
     'FontSize',12,'BackgroundColor','w','EdgeColor','k');