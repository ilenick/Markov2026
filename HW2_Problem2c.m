N = 1e6;

% Constants
c = 4/exp(1);    
accepted = zeros(N,1);

count = 0;
total_draws = 0;

tic
while count < N
    % Sample from proposal g(x) = Exp(1/2)
    Y = -2*log(rand);

    % Acceptance test
    U = rand;
    if U <= (Y*exp(-Y)) / (c*(0.5*exp(-Y/2)))
        count = count + 1;
        accepted(count) = Y;
    end
    total_draws = total_draws + 1;
end
runtime = toc;

fprintf('Runtime: %.2f seconds\n', runtime);
fprintf('Acceptance rate: %.3f\n', N/total_draws);

figure
histogram(accepted, 'Normalization','pdf', 'BinLimits',[0 15])

xlabel('x')
ylabel('Density')
title('Acceptance–Rejection Sampling for f(x)=xe^{-x}')

runtime_str = sprintf('Runtime: %.2f seconds', runtime);
text(8, 0.25, runtime_str, ...
     'FontSize',12,'BackgroundColor','w','EdgeColor','k');
