function cov = covariance(X,U)
coloumns = size(X,2);
V = 0;
for i = 1:coloumns
    Y = X(:,i);
    Y = Y - U;
    H = Y*Y';
    V = V + H;
end
cov = V/coloumns;
end