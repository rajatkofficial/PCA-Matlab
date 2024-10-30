function Y = multiply(X, patch_size,m,n)
Y = [];
rows = m;
coloumns = n;
sz = size(X);
k = 1;
for i = 1:patch_size:rows
    for j = 1:patch_size:coloumns
        Y(i:i+patch_size-1,j:j+patch_size-1)= X(:,:,k);
        k = k+1;
    end
end
end
        