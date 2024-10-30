function C = vectorize(X)
sz = size(X);
sz1 = sz(1)*sz(2);
C = [];
for i = 1:sz(3)
    B = X(:,:,i);
    C(:,i) = reshape(B,[sz1,1]);
end
end
        
        
