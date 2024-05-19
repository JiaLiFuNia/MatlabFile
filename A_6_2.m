clc;clear;close all;

a = 50;
b = 0.2;
c = 4;
% 原始结果
[x,y] = optim2(a,b,c);
x,y
% [sol,fval,flag,out] = optim(a,b,c);
% sol.x
% fval

Fval_a = [];
Fval_b = [];
Fval_c = [];
% 1. a改变时
count = 1;
for a = 40:2:60
    % [sol,fval,flag,out] = optim(a,0.2,4);
    [x,fval] = optim2(a,0.2,4);
    x
    Fval_a(count) = fval
    count = count + 1;
end
subplot(1,3,1);
plot(40:2:60,Fval_a)


% 2. b改变时
count = 1;
for b = 0.1:0.02:0.3
    % [sol,fval,flag,out] = optim(50,b,4);
    [x,fval] = optim2(50,b,4);
    Fval_b(count) = fval
    count = count + 1;
end
subplot(1,3,2);
plot(0.1:0.02:0.3,Fval_b)


% 3. c改变时
count = 1;
for c = 3:0.2:5
    % [sol,fval,flag,out] = optim(50,0.2,c);
    [x,fval] = optim2(50,0.2,c);
    Fval_c(count) = fval
    count = count + 1;
end
subplot(1,3,3);
plot(3:0.2:5,Fval_c)


function [sol,fval,flag,out] = optim(a,b,c)
prob = optimproblem('ObjectiveSense','min');
x = optimvar('x',3,'Type','integer','LowerBound',0,'UpperBound',100);

% 季度        最小    最大    需要   生产    剩余
% 第一季度     40     100     40     x1     x1-40
% 第二季度     0      100     60     x2     x1-40+x2-60
% 第三季度     0      100     80     x3     0

prob.Objective = a*sum(x)+b*sum(x.^2)+(x(1)-40)*c+(x(1)+x(2)-100)*c;
prob.Constraints.con1 = x(1) >= 40;
prob.Constraints.con2 = x(2)+x(1)-40 >= 60;
prob.Constraints.con3 = sum(x) == 180;

[sol,fval,flag,out] = solve(prob);
end


function [x,fval] = optim2(a,b,c)
fun = @(x) a*sum(x)+b*sum(x.^2)+(x(1)-40)*c+(x(1)+x(2)-100)*c;
x0 = rand(3,1);
A = [-1 0 0;-1 -1 0;0 0 0];
B = [-4;-100;0];
Aeq = [1 1 1];
beq = 180;
VLB = [40;0;0];
VUB = [100;100;100];
intcon = [1,2,3];
[x,fval] = fmincon(fun,x0,A,B,Aeq,beq,VLB,VUB);
% [x,fval] = ga(fun,3,A,B,Aeq,beq,VLB,VUB,[],intcon);
end



