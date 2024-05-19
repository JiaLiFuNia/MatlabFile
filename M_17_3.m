y = @(x) (-x-pi).*(x<-pi)+sin(x).*(x>=-pi && x<=pi)+((x-pi)./2).*(x>pi);
fplot(y,[-6,6]);