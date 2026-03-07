N = 1e6;
state = 1;
states = zeros(N,1);

% simulating
for i = 1:N
    states(i) = state;
    r = rand;
    probs = cumsum(P(state,:));
    state = find(r <= probs,1);
end

counts = histcounts(states,1:6);
pi_sim = counts / N;

% eigenvector method
[V,D] = eig(P.');
[~,idx] = min(abs(diag(D)-1));
pi_eig = V(:,idx);
pi_eig = pi_eig/sum(pi_eig);
pi_eig = pi_eig.';

% detailed balance
pi_db = zeros(1,5);
for i = 1:5
    pi_db(i) = exp((a-b)*i*(i-1)/2);
end
pi_db = pi_db/sum(pi_db);

% plot it
states_axis = 1:5;
width = 0.25;

figure
bar(states_axis-width, pi_sim, width)
hold on
bar(states_axis, pi_eig, width)
bar(states_axis+width, pi_db, width)

xlabel('State')
ylabel('Probability')
title('Stationary Distribution Comparison')
legend('Simulation','Eigenvector','Detailed Balance')