x = linspace(0,10,1000);
gx = @(x) (3.*x.^2+4.*x+6).*sin(x)./(x.^2+8.*x+6);
y = gx(x);

pp = csape(x,y);
gx_csape = @(x) fnval(pp,x);
disp(gx_csape);
fplot(gx_csape,[0 10]);

gx_inte = integral(gx,0,10);
gx_csape_inte = integral(gx_csape,0,10);
fprintf("g(x)求积分：%f\n", gx_inte);
fprintf("g(x)'求积分：%f\n", gx_csape_inte);