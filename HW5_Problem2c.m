N = 1e6;             
state = 1;           
states = zeros(N,1); 

P = [1 - k*exp(a*1),        k*exp(a*1),            0,                 0,                 0;
     k*exp(b*1),   1 - k*exp(a*2) - k*exp(b*1),    k*exp(a*2),        0,                 0;
     0,            k*exp(b*2),   1 - k*exp(a*3) - k*exp(b*2),         k*exp(a*3),        0;
     0,            0,            k*exp(b*3),   1 - k*exp(a*4) - k*exp(b*3),  k*exp(a*4);
     0,            0,            0,            k*exp(b*4),       1 - k*exp(b*4)];


for i = 1:N
    states(i) = state;
    
    r = rand;                 
    probs = cumsum(P(state,:));
    
    state = find(r <= probs,1);
end

% fraction in each state
counts = histcounts(states,1:6);
fractions = counts / N;

% plot it
bar(1:5, fractions)
xlabel('State')
ylabel('Fraction of time')
title('Stationary Distribution from Simulating')