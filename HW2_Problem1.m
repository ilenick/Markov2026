%constants
gamma = 4;
x0 = 10;
Nvals = [100 1000 10000];

%functions and such
x = linspace(10,60,1000);
pdf_theory = (gamma-1)*x0^(gamma-1)./x.^gamma;

edges = linspace(0,60,80);

%Run and plot
figure
for i = 1:length(Nvals)
    N = Nvals(i);

    U = rand(N,1);
    X = x0*(1 - U).^(-1/(gamma-1));

    subplot(1,3,i)
    histogram(X, edges, 'Normalization','pdf')
    hold on
    plot(x, pdf_theory, 'LineWidth',2)
    hold off

    xlim([0 60])
    ylim([0 0.03])
    title(['N = ', num2str(N)])
    xlabel('x')
    ylabel('Density')
end