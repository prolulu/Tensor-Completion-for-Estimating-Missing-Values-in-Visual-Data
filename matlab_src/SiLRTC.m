function X2 = SiLRTC(Image,K,known)
tic;
%assuming image is 3 dimensional
imSize = size(Image);

%Corrupting Image
X = zeros(imSize);
X = double(ReplaceInd(X,known,Image,imSize));

%Create random alphas and betas
b = abs(randn(3,1))/200;
a = abs(randn(3,1));
a = a./sum(a);

%main loop
for k = 0:K
    %initialize Mi's
    M = zeros(imSize);
    for i = 1:3
        %Create Mi's multiply by appropriate beta value
        %fold them and add into tensor get Mi values immediately into
        %tensor for so X can be updated
        %M = M + Mfold(b(i)*shrinkage(unfold(X,i),a(i)/b(i)),i,imSize);
        M = M + Mfold(b(i)*shrinkage(ten2mat(X,i),a(i)/b(i)),i,imSize);
    end
    %Divide by sum of betas
    M = M./sum(b);

    %Update indices that we know from Image into M and set X equal to M
    M = ReplaceInd(M,known,Image,imSize);
    X = M;
end
%Ouput Image
%imwrite(uint8(X),'html/SiFinal.jpg')
imshow(uint8(X));
%Output Absolute Value Error Image
%imwrite(uint8(abs(double(Image)-double(X))),'html/SiError.jpg')
X2 = X;
toc;
end