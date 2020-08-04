function D = shrinkage(X,t)
[U,Sig,V] = svd(X,'econ');
for i = 1:size(Sig,1)
    Sig(i,i) = max(Sig(i,i)-t,0); %Éú³É¶Ô½ÇÕó
end
D = U*Sig*V';
end