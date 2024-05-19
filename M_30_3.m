prob = optimproblem('ObjectiveSense','max');
x = optimvar('x',8,'Type','integer','LowerBound',0);

% 产品I   A1:x1 A2:x2  B1:x3    B2:x4 B3:x5  x1+x2=x3+x4+x5
% 产品II  A1:x6 A2:x7  B1:x6+x7              x6+x7
% 产品III       A2:x8           B2:x8        x8      

% 利润最大
c = [1.25-0.25 2.00-0.35 2.80-0.50];
prob.Objective = c*[x(1)+x(2);x(6)+x(7);x(8)];

% 不超过有效台时
A = [5 10 0;7 9 12;6 8 0;4 0 11;7 0 0];
b = [6000;10000;4000;7000;4000];
prob.Constraints.con1 = 5*x(1)+10*x(6) <= 6000;
prob.Constraints.con2 = 7*x(2)+9*x(7)+12*x(8) <= 10000;
prob.Constraints.con3 = 6*x(3)+8*(x(6)+x(7)) <= 4000;
prob.Constraints.con4 = 4*x(4)+11*x(8) <= 7000;
prob.Constraints.con5 = 7*x(5) <= 4000;

% 产品I
prob.Constraints.con6 = x(1)+x(2)==x(3)+x(4)+x(5);

% 
[sol,fval,flag,out] = solve(prob);
res = sol.x
w = fval-(300+321+250+783+200)