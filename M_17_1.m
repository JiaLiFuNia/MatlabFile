subplot(1,2,1);
t = 0:0.01:2*pi;
a = 1;
x = a.*(1-cos(t)).*cos(t);
y = a.*(1-cos(t)).*sin(t);
plot(x,y);
title('这是心形线')
grid on;
text(0,1,'心形线');
xlabel('x轴');
ylabel('y轴');
legend('心形线')
axis equal;
axis([-2 2 -2 2]);
gtext('心形线');


subplot(1,2,2);
x = -2:0.01:2;
y = -2:0.01:2;
[X,Y] = meshgrid(x,y);
Z = X.^2 - Y.^2;
mesh(X,Y,Z);
grid on;
title('这是马鞍面')
text(0,1,1,'马鞍面');
xlabel('x轴');
ylabel('y轴');
zlabel('z轴');
legend('马鞍面');
axis equal;
