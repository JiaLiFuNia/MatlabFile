function [fitresult, gof] = createFit(x, y, description, i)
[xData, yData] = prepareCurveData( x, y );

% 设置 fittype 和选项。
ft = fittype( 'poly5' );

% 对数据进行模型拟合。
[fitresult, gof] = fit(xData, yData, ft , 'Normalize', 'on');

% 绘制数据拟合图。
subplot(3,3,i)
h = plot(fitresult, xData, yData);
legend(h, '原始数据', description, 'Location', 'NorthEast', 'Interpreter', 'none');
% 为坐标区加标签
ylabel('放电时间 t/min')
xlabel('电压 U/V')
grid on


