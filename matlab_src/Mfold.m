function c = Mfold(a,i,OrDim)
c = [];
for j = 1:OrDim(i)
    switch i
        case 1
            c(j,:,:) = reshape(a(j,:),OrDim(2),OrDim(3));
        case 2
            c(:,j,:) = reshape(a(j,:),OrDim(1),OrDim(3));
        case 3
            c(:,:,j) = reshape(a(j,:),OrDim(1),OrDim(2));
    end
end
end