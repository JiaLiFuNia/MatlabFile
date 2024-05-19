format long
N = 30;
k = 1:1:N-1;
lma = 4.*sin(pi.*k./N).^2; % = 0.0362;
min(lma)
plot(k,lma)
