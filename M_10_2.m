% 求数的阶乘
m = 0;
for j = 1:20
    % n = factorial(j); 阶乘的函数
    n = 1;
    for i = 2:j
        n = n*i;
    end
    m = m + n;
    disp(n)
end
fprintf("n的阶乘: %d\n",n);
fprintf("和: %d\n",m);