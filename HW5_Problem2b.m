a = 0.04;
b = 0.16;
k = 0.1;

P = [1 - k*exp(a*1),        k*exp(a*1),            0,                 0,                 0;
     k*exp(b*1),   1 - k*exp(a*2) - k*exp(b*1),    k*exp(a*2),        0,                 0;
     0,            k*exp(b*2),   1 - k*exp(a*3) - k*exp(b*2),         k*exp(a*3),        0;
     0,            0,            k*exp(b*3),   1 - k*exp(a*4) - k*exp(b*3),  k*exp(a*4);
     0,            0,            0,            k*exp(b*4),       1 - k*exp(b*4)];

[V,D] = eig(P.');

pi = V(:,abs(diag(D)-1) < 1e-10);
pi = pi/sum(pi);                 

disp(pi);