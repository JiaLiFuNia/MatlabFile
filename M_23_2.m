
% 合理利用线材问题。现要做100套钢架，每套用长为2.9m, 2.1m和
% 1.5m的元钢各一根，已知原料长7.4m，问应该如何下料，使用的原材
% 料最省。

prob = optimproblem('ObjectiveSense','min');
x = optimvar('x',5,'Type','integer','LowerBound',0);
c = [1 1 1 1 1];
Aeq = [1 2 0 1 0;0 0 2 2 1;3 1 2 0 3];
beq = [100;100;100];
prob.Objective = c*x;
prob.Constraints.con = Aeq*x == beq;
[sol,fval,flag,out] = solve(prob);
sol.x
