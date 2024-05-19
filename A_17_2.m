%% 5.5
a = [-1 2 5 8];
fx = @(x) a(4).*x.^3+a(3).*x.^2+a(2).*x+a(1);
x = linspace(-6,6,100);

%% (1)
y = fx(x);
a_1 = polyfit(x,y,3);
disp(a_1);

%% (2)
y_1 = y + randn(1,100);
a_2 = polyfit(x,y_1,3);
disp(a_2);

%%
% 用于根据系数和次数生成n次多项式
function f = duoxiangshi(n,a) % n:次数  a:系数
syms x;
f = 0;
a = flip(a);
for i = n+1:-1:1
    f = f + a(i)*x^(i-1);
end
end