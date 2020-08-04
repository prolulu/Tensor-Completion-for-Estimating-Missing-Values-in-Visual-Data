function [a,b] = FindInd(num,mSize)
a = ceil(num/mSize(2));
b = mSize(1) - mod(num,mSize(1));
end