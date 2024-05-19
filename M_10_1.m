% 求一个矩阵中的最大值
a = round(rand(4,5)*100);
m = max(max(a));
[x,y] = find(a==m);
disp(a)
disp(m)
disp([x,y])