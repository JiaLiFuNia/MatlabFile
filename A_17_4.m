t_data = [0.5 1 2 3 4 5 7 9];
V_data = [6.36 6.48 7.26 8.22 8.66 8.99 9.43 9.63];
plot(t_data,V_data)
hold on;
V = 10;
x0 = [2,7];

ft = @(a,b,x) V-(V-a).*exp(-x./b);
f = fittype(ft);
x = fit(t_data', V_data', f, 'StartPoint', x0);
disp(x);

a = 5.558;
b = 3.5;
ft = @(x) V-(V-a).*exp(-x./b);
fplot(ft,[0,10]);
hold off;