f = @(x) x(1).^2+4.*x(2).^2+9.*x(3).^2-2.*x(1)+18.*x(2);
[x,fval,exitflag,output] = fminunc(f,[0 0 0])
% [x,fval,exitflag,output] = fminsearch(f,[0 0 0])

