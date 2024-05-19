r = 2; % 指定半径

[X,Y,Z] = sphere;
X2 = X * r;
Y2 = Y * r;
Z2 = Z * r;
surf(X2,Y2,Z2)
axis equal
hold on;


f = @(x,y) x.^2+y.^2-r.*x;
fimplicit3(f,[-2 2 -2 2 -2.5 2.5])
hold off;