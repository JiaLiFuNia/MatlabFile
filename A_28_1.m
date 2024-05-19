clc;
clear;
close all;

global d;
d = 1; % 定义棍在地面上的投影为2
%% 圆
[t,y]=ode45(@yx,[0,10],[2,0]);
T=0:0.1:10;
X=1*cos(T);
Y=1*sin(T);
figure(1);
plot(X,Y,'-')
hold on
plot(y(:,1),y(:,2),'*')
axis equal
hold off;
legend('小孩','玩具')

%% 直线
[t,y]=ode45(@zx,[0,10],[1,0]);
T=0:0.1:10;
X=T;
Y=T;
figure(2);
plot(X,Y,'-')
hold on
plot(y(:,1),y(:,2),'*')
axis equal
hold off;
legend('小孩','玩具')

%% 椭圆
[t,y]=ode45(@ty,[0,10],[1,0]);
T=0:0.1:10;
X = 1*cos(T);
Y = 2*sin(T);
figure(3);
plot(X,Y,'-')
hold on
plot(y(:,1),y(:,2),'*')
axis equal
hold off;
legend('小孩','玩具')

%% 函数
function dy = yx(t,y)
global d;
dy = zeros(2,1);
dy(1) = 1/d^2*((-1)*sin(t)*(cos(t)-y(1))+cos(t)*(sin(t)-y(2)))*(cos(t)-y(1));
dy(2) = 1/d^2*((-1)*sin(t)*(cos(t)-y(1))+cos(t)*(sin(t)-y(2)))*(sin(t)-y(2));
end

function dy = zx(t,y)
global d;
dy = zeros(2,1);
dy(1) = 1/d^2*((t-y(1))+(t-y(2)))*(t-y(1));
dy(2) = 1/d^2*((t-y(1))+(t-y(2)))*(t-y(2));
end

function dy = ty(t,y)
global d;
dy = zeros(2,1);
dy(1) = 1/d^2*(2*(-1)*sin(t)*(2*cos(t)-y(1))+3*cos(t)*(3*sin(t)-y(2)))*(2*cos(t)-y(1));
dy(2) = 1/d^2*(2*(-1)*sin(t)*(2*cos(t)-y(1))+3*cos(t)*(3*sin(t)-y(2)))*(3*sin(t)-y(2));
end