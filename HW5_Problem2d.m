a = 0.04;
b = 0.16;
k = 0.1;
N = 1e6;
state = 1;
states = zeros(N,1);

P = [1 - k*exp(a*1),        k*exp(a*1),            0,                 0,                 0;
     k*exp(b*1),   1 - k*exp(a*2) - k*exp(b*1),    k*exp(a*2),        0,                 0;
     0,            k*exp(b*2),   1 - k*exp(a*3) - k*exp(b*2),         k*exp(a*3),        0;
     0,            0,            k*exp(b*3),   1 - k*exp(a*4) - k*exp(b*3),  k*exp(a*4);
     0,            0,            0,            k*exp(b*4),       1 - k*exp(b*4)];


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