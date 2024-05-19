% 方法二
prob = optimproblem('ObjectiveSense','max');
x = optimvar('x',3);
prob.Objective = 2*x(1)+3*x(1)^2+3*x(2)+x(2)^2+x(3);
prob.Constraints.con1 = [x(1)+2*x(1)^2+x(2)+2*x(2)^2+x(3) <= 10
        x(1)+x(1)^2+x(2)+x(2)^2-x(3) <= 50
        2*x(1)+x(1)^2+2*x(2)+x(3) <= 40
        -x(1)-2*x(2) <= -1
        -x(1) <= 0];
prob.Constraints.con2 = x(1)^2+x(3)==2;
x0.x = rand(3,1);
[sol,fval,flag,out] = solve(prob,x0);
sol.x
fval


% 方法一
fx = @(x) -(2*x(1)+3*x(1)^2+3*x(2)+x(2)^2+x(3));
A = [-1 -2 0;-1 0 0];
b = [-1;0];
[x,y] = fmincon(fx,rand(3,1),A,b,[],[],[],[],@gx);
x
-y

function [c,ceq] = gx(x)
c = [x(1)+2*x(1)^2+x(2)+2*x(2)^2+x(3)-10;
    x(1)+x(1)^2+x(2)+x(2)^2-x(3)-50;
    2*x(1)+x(1)^2+2*x(2)+x(3)-40];
ceq = x(1)^2+x(3)-2;
end


