function mOut = ReplaceInd(X,known,Image,imSize)
for i = 1:length(known)
    [in1,in2] = FindInd(known(i),imSize);
    X(in1,in2,:) = double(Image(in1,in2,:));
end
mOut = X;
end