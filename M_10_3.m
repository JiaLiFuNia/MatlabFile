% 多项式的值
x = input("input x:");
y = input("input y:");

% 一
f = @(x,y)x^2+sin(x*y)+2*y;
resqult = f(x,y);
fprintf("值为%g\n",resqult);

% 二
x2 = [x,y];
f = x2(1)^2+sin(x2(1)*x2(2))+2*x2(2);
fprintf("值为%g\n",resqult);
