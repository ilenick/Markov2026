P = [1/2 1/2 0   0   0   0;
     0   1/2 1/2 0   0   0;
     1/3 0   1/3 1/3 0   0;
     0   0   0   1/2 1/2 0;
     0   0   0   0   0   1;
     0   0   0   0   1   0];
N = 1000;
count = 0;

for sim = 1:N
    state = 1;  
    
    for t = 1:5
        state = randsample(1:6, 1, true, P(state,:));
    end
    
    if state == 4
        count = count + 1;
    end
end

disp (count / N);

