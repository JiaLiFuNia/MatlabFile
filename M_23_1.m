
% 有两个煤场A、B，每月进煤分别不少于60t、100t, 他们担负
% 供应三个居民区用煤任务，这三个居民区每月需要用煤分别为
% 45t、75t、40t；A场离这三个居民区分别为10km、5km、6km
% ，B厂离这三个居民区分别为4km、8km、15km，问这两煤场如
% 何分配供煤，才能使总运输量最小

prob = optimproblem('ObjectiveSense','min');
x = optimvar('x',6,'LowerBound',0);
c = [10 5 6 4 8 15];
A = [1 1 1 0 0 0;0 0 0 1 1 1];
Aeq = [1 0 0 1 0 0;0 1 0 0 1 0;0 0 1 0 0 1];
beq = [45;75;40];
b = [60;100];
prob.Objective = c*x;
prob.Constraints.con1 = A*x <= b;
prob.Constraints.con2 = Aeq*x == beq;
prob.Constraints
[sol,fval,flag,out] = solve(prob);
sol.x
