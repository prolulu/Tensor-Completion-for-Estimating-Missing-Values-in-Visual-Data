function [Sig,T] = Trimming(X,t)
[U,Sig,V] = svd(X,'econ');
SigT = Sig;
for i = 1:size(SigT,1)
    SigT(i,i) = min(SigT(i,i),t);
end
T = U*SigT*V';
end
