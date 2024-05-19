% Netown
X = [0,2,4];
FX = [-2,1,4];
n = length(X)-1;
syms x
qx = @(i) x-X(i);
Qx = 0;
qx0 = 1;
for i = 1:n+1
    Qx = Qx + fy(X(1:i),FX)*qx0;
    qx0 = qx0*(x-X(i));
end
Qx

function f = fy(y,fx)
k = length(y);
f = 0;
for i = 1:k
    f_down = 1;
    for I = 1:k
        if i == I
            continue;
        end
        f_down = f_down*(y(i)-y(I));
    end
    f = f+(fx(i)/f_down);
end
end