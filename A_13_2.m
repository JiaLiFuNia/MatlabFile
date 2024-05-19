T = 700:20:780;
V = [0.0977 0.1218 0.1406 0.1551 0.1664];
F = griddedInterpolant(T,V,'spline');
pp = csape(T,V);

F_f = @(x) F(x);
pp_f = @(x) fnval(pp,x);


V_750_F = F_f(750);
V_750_pp = pp_f(750);

V_770_F = F_f(770);
V_770_pp = pp_f(770);
disp([V_750_F, V_750_pp, V_770_F, V_770_pp]);

fplot(F_f);
hold on;
fplot(pp_f);
hold off;
legend('线性插值函数','三次样条插值函数')