function Y = revectorize(X,patch_size)
A = [];
F = zeros(patch_size);
coloumns = size(X,2);
k = 1;
for i = 1:coloumns
    F = reshape(X(:,i),[patch_size,patch_size]);
    A(:,:,k) = F;
    k = k+1;
end 
Y = A;
end