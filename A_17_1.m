%% e.p. 1
x = 0.1:0.1:1.1;
y = [-0.447 1.978 3.280 6.160 7.080 7.340 7.660 9.560 9.480 9.300 11.20];
figure(1);
for i = 1:length(x)
    plot(x(i),y(i),'o');
    hold on;
end

% way_1
a = polyfit(x,y,2);

% way_2
R = [(x.^2)' x' ones(11,1)];
A = R\y';
f = duoxiangshi(2,A,x);
plot(x,f);
hold off;

%% e.p. 2
tdata = 100:100:1000;
cdata = 1e-03*[4.54,4.99,5.35,5.65,5.90,6.10,6.26,6.39,6.50,6.59];
figure(2);
for i = 1:length(tdata)
    plot(tdata(i),cdata(i),'o');
    hold on;
end
x0 = [0.2 0.05 0.05];
x = lsqcurvefit(@curvefun1,x0,tdata,cdata);
f = curvefun1(x,tdata);
plot(tdata,f);
hold off;

%% e.p. 3
x0=[0.2,0.05,0.05];
x=lsqnonlin(@curvefun2,x0);
f= curvefun2(x)';

function f=curvefun2(x)
    tdata=100:100:1000;
    cdata=1e-03*[4.54,4.99,5.35,5.65,5.90,6.10,6.26,6.39,6.50,6.59];
    f=x(1)+x(2)*exp(-0.02*x(3)*tdata)- cdata;
end

%% e.p. 4
function f = curvefun1(x,tdata)
f = x(1) + x(2)*exp(-0.02*x(3)*tdata);
end


% 3*x^2+2*x+1
function f = duoxiangshi(n,a,x)
    f = 0;
    a = flip(a);
    for i = n+1:-1:1
        f = f + a(i).*x.^(i-1);
    end
end