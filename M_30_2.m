f = @(x) (x(1)-1).^4+2.*x(2).^2;
[x,fval,exitflag,output] = fminunc(f,[0 1])
% [x,fval,exitflag,output] = fminsearch(f,[0 0 0])
