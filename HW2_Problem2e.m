N = 1e6;

tic
% Generate two exp(1) vars
E1 = -log(rand(N,1));
E2 = -log(rand(N,1));

% add 'em
X = E1 + E2;
runtime = toc;

fprintf('Runtime for %d samples: %.4f seconds\n', N, runtime);

% Theoretical PDF
xgrid = linspace(0,15,1000);
pdf_theory = xgrid .* exp(-xgrid);

figure
histogram(X, 'Normalization','pdf', 'BinLimits',[0 15])
hold on
plot(xgrid, pdf_theory, 'LineWidth',2)
hold off

xlabel('x')
ylabel('Density')
title('Histogram of Samples with Theoretical PDF')
legend('Numerical histogram','Theoretical PDF')
