p = [9/10 1/10 0;
    0 7/8 1/8;
    2/5 0 3/5];

N = 10000;
states = zeros(1, N);
states(1) = 1;

for t = 2:N
    current = states(t-1);
    u = rand;

    if u <= M(current,1)
        states(t) = 1;
    elseif u <= M(current,1) + M(current,2)
        states(t) = 2;
    else
        states(t) = 3;
    end
end

fraction = sum(states == 1) / N;
disp(fraction);