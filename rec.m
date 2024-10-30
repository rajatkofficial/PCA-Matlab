function Y = rec(X,U,V,k)

F = X - repmat(U,[1,12288]);
G = V(:,1:k);
W = F'*G;
P = G*W';
y = size(P,2);
Y = P + repmat(U,[1,y]);
end
