rng(1)
Nsample = 1e6;
kval = 2:10;
nval = 2.^kval;

S_num = zeros(size(nval));
S_theoretical = 1 ./ sqrt(nval);

parfor idx = 1:length(nval)
    n = nval(idx);
    Sn = poissrnd(n, Nsample, 1);
    Yn = (Sn -n) / sqrt(n);
    S_num(idx) = skewness(Yn);
end

loglog(nval, abs(S_num), 'o-', 'LineWidth', 1.5)
hold on
loglog(nval, S_theoretical, '--', 'LineWidth', 1.5)
hold off

title('Comparison of Theoretical and Numerical Y_n Skewness')
xlabel('n')
ylabel('Skewness S(n)')
legend('Numerical', 'Theoretical', 'Location', 'southwest')
grid on