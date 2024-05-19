prob = optimproblem('ObjectiveSense','min');
x = optimvar('x',6,'Type','integer','LowerBound',0);

A = [1 1 1 0 0 0;0 1 0 1 0 0;0 0 1 0 1 0;0 0 0 1 0 1;1 1 1 0 0 0;0 0 0 0 1 1;1 0 0 0 0 0;0 1 0 1 0 1];

prob.Objective = sum(x);
prob.Constraints.con = A*x >= 1;

[sol,fval,flag,out] = solve(prob);
res = sol.x