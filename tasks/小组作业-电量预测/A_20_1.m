clc;
clear;
close all;
%% 读取数据
battery_data_1 = readmatrix('data.xlsx','Sheet','附件1','Range','A3:J1885');
battery_data_2 = readmatrix('data.xlsx','Sheet','附件2','Range','A3:E303');
A = [' 20A';' 30A';' 40A';' 50A';' 60A';' 70A';' 80A';' 90A';'100A'];

%% 拟合放电曲线
% 求拟合曲线
f_A = cell(9,1);
Position=[50,100,1200,700];
for i = 2:10
    x = battery_data_1(:,i); % 电压
    y = battery_data_1(:,1); % 时间

    isNan = isnan(x);
    pos = find(isNan == 0);
    x = x(pos);
    y = y(pos);
    figure(5)
    plot(x,y);
    hold on;
end
hold off;
set (gcf,'Position',Position);
for i = 2:10
    x = battery_data_1(:,i); % 电压
    y = battery_data_1(:,1); % 时间

    isNan = isnan(x);
    pos = find(isNan == 0);
    x = x(pos);
    y = y(pos);

    Valid_location = fix(length(x)*0.2);
    x = x(Valid_location:end);
    y = y(Valid_location:end);
    [m,n] = createFit(x,y,A(i-1,:),i-1);
    f_A{i-1} = m;
    hold on;
end
hold off;

% 求放电时间
figure(2);
for i = 2:6
    subplot(2,3,i-1);
    f = f_A{i};
    plot(f,[9,11],[0,3000]);
    set(gca,'XTick',9:0.5:11)
    title(A(i,:));
    hold on;

    x = battery_data_1(:,i+1);
    y = battery_data_1(:,1);
    isNan = isnan(x);
    pos = find(isNan == 0);
    y = y(pos);

    time_t = f(9.8);
    fprintf("%s 状态下，剩余放电时间：%f min\n",A(i,:), y(end)-time_t);
end
hold off;

%% MRE
for i = 2:10
    x = flip(battery_data_1(:,i)); % 电压
    y = flip(battery_data_1(:,1)); % 时间

    isNan = isnan(x);
    pos = find(isNan == 0);
    x = x(pos);
    y = y(pos);

    xx = zeros(length(x)-1,1);
    for j = 2:length(x)
        xx(j-1) = abs(x(j)-x(j-1));
    end

    count = 1;
    x_5(count) = x(1);
    y_5(count) = y(1);
    for j = 1:length(xx)
        if xx(j) <= 0.005
            count = count + 1;
            x_5(count) = x(j+1);
            y_5(count) = y(j+1);
        end
        if count >= 231
            break
        end
    end

    f = f_A{i-1};
    y_5_ = f(x_5');
    mre = mean(abs(y_5_-y_5')./y_5');
    disp(mre*100);
end

%% 任一恒定电流强度放电时的放电曲线
pp = zeros(9,6);
f_B = cell(6,1);
for i = 1:9
    f = f_A{i};
    pp(i,:) = coeffvalues(f);
end
figure(3);
for i = 1:6
    subplot(2,3,i);
    plot(20:10:100,pp(:,i));
    hold on;

    ft = fittype('poly5');
    xData = 20:10:100;
    yData = pp(:,i);
    [fitresult, gof] = fit(xData',yData,ft,'Normalize','on');

    plot(fitresult)
    fitresult(100)
    f_B{i} = fitresult;
end
hold off;

fff = @(v,A) f_B{1}(A)*v^5+f_B{2}(A)*v^4+f_B{3}(A)*v^3+f_B{4}(A)*v^2+f_B{5}(A)*v+f_B{6}(A);
fff(9.8,100)
figure(4)
I=20:10:100;
subplot(2,2,1);
Tmax=[3764 2454 1724 1308 1044 862 730 620 538]';
plot(I,Tmax,'*')
hold on
p1=polyfit(I,Tmax,4);

I1=20:1:100;
Tmax1=p1(1)*I1.^4+p1(2)*I1.^3+p1(3)*I1.^2+p1(4)*I1+p1(5);
plot(I1,Tmax1,'r-')
legend('原始数据','拟合数据')
title('Tmax(I)与I关系图像')


subplot(2,2,2);
I=20:10:100;
a=[0.0238 0.0315 0.0372 0.0489 0.0523 0.0481 0.0479 0.0490 0.0486]';
plot(I,a,'o')
hold on

p2=polyfit(I,a,7);
a1=p2(1)*I1.^7+p2(2)*I1.^6+p2(3)*I1.^5+p2(4)*I1.^4+p2(5)*I1.^3+p2(6)*I1.^2+p2(7)*I1+p2(8);
plot(I1,a1,'r-')
legend('原始数据','拟合数据')
title('a(I)与I关系图像')


subplot(2,2,3);
I=20:10:100;
b=[0.5136 0.5046 0.5040 0.4811 0.4839 0.5050 0.5146 0.5210 0.5300]';
plot(I,b,'x')
hold on

p3=polyfit(I,b,7);
b1=p3(1)*I1.^7+p3(2)*I1.^6+p3(3)*I1.^5+p3(4)*I1.^4+p3(5)*I1.^3+p3(6)*I1.^2+p3(7)*I1+p3(8);
plot(I1,b1,'r-')
legend('原始数据','拟合数据')
title('b(I)与I关系图像')


subplot(2,2,4);
T=1:1000;
U=a1(55)*(Tmax1(55)-T).^b1(55)+9;
plot(T,U,'-')
title('55A时的放电曲线图像')



