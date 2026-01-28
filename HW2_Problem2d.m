N = 1e6;

tic
% Generate two exp(1) vars
E1 = -log(rand(N,1));
E2 = -log(rand(N,1));

% add 'em
X = E1 + E2;
runtime = toc;

fprintf('Runtime for %d samples: %.4f seconds\n', N, runtime);

% plot it
figure
histogram(X, 'Normalization','pdf', 'BinLimits',[0 15])

xlabel('x')
ylabel('Density')
title('Gamma(2, 1) by Summing Exponentials')

runtime_str = sprintf('Runtime: %.4f seconds', runtime);
text(8, 0.25, runtime_str, ...
     'FontSize',12,'BackgroundColor','w','EdgeColor','k');
