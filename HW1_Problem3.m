rng(0);                

%f(u) function
f = @(u) u.^4 ./ (1 + u.^6);

%1.1, 1.2, ..., 4.9, 5 
x = 1:0.1:5;
Nvec = floor(10.^x);

trials = 20;
E = zeros(size(Nvec));

% Trials
for i = 1:length(Nvec)
    N = Nvec(i);
    fracs = zeros(trials,1);
    for t = 1:trials
        u = rand(N,1);
        v = rand(N,1);
        fracs(t) = mean(v <= f(u)); 
    end
    E(i) = mean(fracs); 
end

% Actual integral
Itrue = integral(f, 0, 1, 'AbsTol',1e-12,'RelTol',1e-12);

% Plot
figure('Color','w','Position',[200 200 800 450])
hold on

plot(Nvec, E, 'bo-', 'LineWidth',1.2, 'MarkerSize',5, ...
     'MarkerFaceColor','b') 

yline(Itrue, 'r--', 'LineWidth',2);

set(gca, 'XScale', 'log'); 
xlabel('N (log scale)');
ylabel('Estimated integral E(N)');
title('Monte Carlo Estimates');
legend('Monte Carlo estimate', ...
       sprintf('Numerical integral = %.6f', Itrue), ...
       'Location','best');
grid on
xlim([min(Nvec)*0.9 max(Nvec)*1.1])
hold off
