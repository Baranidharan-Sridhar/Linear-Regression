function [X]=orderX(X,n)

if (n==1)
  X=X;
elseif (n==2)
  X=[X X.^2];
elseif (n==3)
  X=[X X.^2 X.^3];
elseif (n==4)
  X=[X X.^2 X.^3 X.^4];

endif
end	