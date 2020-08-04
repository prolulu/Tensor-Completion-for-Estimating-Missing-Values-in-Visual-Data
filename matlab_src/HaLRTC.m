function X2 = HaLRTC(Image,K,known)
tic;
%assuming image is 3 dimensional
imSize = size(Image);

%Corrupting Image
X = zeros(imSize);
X = double(ReplaceInd(X,known,Image,imSize));

%Setup alpha and rho values
a = abs(randn(3,1));
a = a./sum(a);
p = 1e-6;

%Create tensor holders for Mi and Yi done to simplify variable storage

ArrSize = [imSize,ndims(Image)];
Mi = zeros(ArrSize);
Yi = zeros(ArrSize);
K = K - 10;
%Main Loop
for k = 0:K

    %Calculate Mi tensors (Step 1)
    for i = 1:3
        Mi(:,:,:,i) = Mfold(shrinkage(ten2mat(X,i) ...
            + ten2mat(squeeze(Yi(:,:,:,i)),i)./p,a(i)/p),i,imSize);
    end

    %Update X (Step 2)
    X = (sum(Mi-Yi./p,4))/3;
    X = ReplaceInd(X,known,Image,imSize);

    %Update Yi tensors (Step 3)
    for i = 1:ArrSize(length(ArrSize))
        Yi(:,:,:,i) =  squeeze(Yi(:,:,:,i))-p*(squeeze(Mi(:,:,:,i))-X);
    end

    %Modify rho to help convergence
    p = 1.2*p;
end
toc;
%Output Image
%imwrite(uint8(X),'html/HaFinal.jpg')
imshow(uint8(X));
%Output Absolute Value Error Image
%imwrite(uint8(abs(double(Image)-double(X))),'html/HaError.jpg')
X2 = X;
end