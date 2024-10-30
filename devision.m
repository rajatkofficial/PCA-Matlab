function A = devision(M,patch_size)
rows = size(M,1);
coloumns = size(M,2);

X = zeros(patch_size);
A = [];
k = 1;
for i = 1:patch_size:rows
    for j = 1:patch_size:coloumns
       % if i+7 > rows || j+7 > coloumns:
            
        X = M(i:i+patch_size-1,j:j+patch_size-1);
        A(:,:,k) = X;
        k = k +1;
    end 
end 
end


                