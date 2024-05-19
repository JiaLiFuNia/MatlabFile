% Laglange
tic
X = [0.4,0.5,0.7,0.8];
FX = log(X);
Langrange(X,FX);
toc

function Px = Langrange(X,FX)
[~,c] = size(X);
syms x Xi;
wx = x-Xi;
w = 1;
for i = 1:c
    w = subs(wx,'Xi',X(i))*w;
end
q = w/((x-Xi)*diff(subs(w,'x',Xi)));

Px = 0;
for n = 1:c
    Px = FX(n)*subs(q,'Xi',X(n)) + Px;
    simplify(Px)
    fplot(Px,'r');
end

end