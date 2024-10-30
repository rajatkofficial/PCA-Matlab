I = im2double(imread('watch.bmp'));
R = I(:,:,1); % Red channel
G = I(:,:,2); % Green channel
B = I(:,:,3); % Blue channel
Xr = devision(R,8);
sz = size(Xr);
sz2 = size(R);
r = sz2(1);
c = sz2(2);
Xg = devision(G,8);
Xb = devision(B,8);
%reshape(A,[4,1]);
Xrv = vectorize(Xr);
Xgv = vectorize(Xg);
Xbv = vectorize(Xb);
Ur = sum(Xrv,2);
%Ur = Ur';
Ur = Ur/sz(3);
Ug = sum(Xgv,2);
%Ug = Ug';
Ug = Ug/sz(3);
Ub = sum(Xbv,2);
%Ub = Ub';
Ub = Ub/sz(3);
covr = covariance(Xrv,Ur);
covg = covariance(Xgv,Ug);
covb = covariance(Xbv,Ub);
[Vr,lambdar] = eig(covr);
lambdar = diag(lambdar);
[lambdar,indicesr] = sort(lambdar,'descend');
Vr = Vr(:,indicesr);
[Vg,lambdag] = eig(covg);
lambdag = diag(lambdag);
[lambdag,indicesg] = sort(lambdag,'descend');
Vg = Vg(:,indicesg);
[Vb,lambdab] = eig(covb);
lambdab = diag(lambdab);
[lambdab,indicesb] = sort(lambdab,'descend');
Vb = Vb(:,indicesb);
%% For k = 5
Xrr1 = rec(Xrv,Ur,Vr,5);
Xgr1 = rec(Xgv,Ug,Vg,5);
Xbr1 = rec(Xbv,Ub,Vb,5);
Xar1 = revectorize(Xrr1,8);
Xag1 = revectorize(Xgr1,8);
Xab1 = revectorize(Xbr1,8);
Rr1 = multiply(Xar1,8,r,c);
Gr1 = multiply(Xag1,8,r,c);
Br1 = multiply(Xab1,8,r,c);
In1(:,:,1) = Rr1;
In1(:,:,2) = Gr1;
In1(:,:,3) = Br1;
imshow(In1);
title('Compressed image, K=5');
% Computing Error
V1 = In1-I;
V1 = V1.^2;
e1 = sum(V1,'all');
Error1 = sqrt(e1);
%% For k = 10
Xrr2 = rec(Xrv,Ur,Vr,10);
Xgr2 = rec(Xgv,Ug,Vg,10);
Xbr2 = rec(Xbv,Ub,Vb,10);
Xar2 = revectorize(Xrr2,8);
Xag2 = revectorize(Xgr2,8);
Xab2 = revectorize(Xbr2,8);
Rr2 = multiply(Xar2,8,r,c);
Gr2 = multiply(Xag2,8,r,c);
Br2 = multiply(Xab2,8,r,c);
In2(:,:,1) = Rr2;
In2(:,:,2) = Gr2;
In2(:,:,3) = Br2;
imshow(In2);
title('Compressed image, K=10');
% Computing Error
V2 = In2-I;
V2 = V2.^2;
e2 = sum(V2,'all');
Error2 = sqrt(e2);
%% For k = 20
Xrr3 = rec(Xrv,Ur,Vr,20);
Xgr3 = rec(Xgv,Ug,Vg,20);
Xbr3 = rec(Xbv,Ub,Vb,20);
Xar3 = revectorize(Xrr3,8);
Xag3 = revectorize(Xgr3,8);
Xab3 = revectorize(Xbr3,8);
Rr3 = multiply(Xar3,8,r,c);
Gr3 = multiply(Xag3,8,r,c);
Br3 = multiply(Xab3,8,r,c);
In3(:,:,1) = Rr3;
In3(:,:,2) = Gr3;
In3(:,:,3) = Br3;
imshow(In3);
title('Compressed image, K=20');
% Computing Error
V3 = In3-I;
V3 = V3.^2;
e3 = sum(V3,'all');
Error3 = sqrt(e3);
%% For k = 64
Xrr4 = rec(Xrv,Ur,Vr,64);
Xgr4 = rec(Xgv,Ug,Vg,64);
Xbr4 = rec(Xbv,Ub,Vb,64);
Xar4 = revectorize(Xrr4,8);
Xag4 = revectorize(Xgr4,8);
Xab4 = revectorize(Xbr4,8);
Rr4 = multiply(Xar4,8,r,c);
Gr4 = multiply(Xag4,8,r,c);
Br4 = multiply(Xab4,8,r,c);
In4(:,:,1) = Rr4;
In4(:,:,2) = Gr4;
In4(:,:,3) = Br4;
imshow(In4);
title('Compressed image, K=64');
% Computing Error
V4 = In4-I;
V4 = V4.^2;
e4 = sum(V4,'all');
Error4 = sqrt(e4);
%% Showing all images
subplot(221);
imshow(In1);
title('Compressed image, K=5');
subplot(222);
imshow(In2);
title('Compressed image, K=10');
subplot(223)
imshow(In3);
title('Compressed image, K=20');
subplot(224);
imshow(I);
title('Original image');
%% Computing Error curve
Err = [];
for k = 1:64
    Xrr = rec(Xrv,Ur,Vr,k);
    Xgr = rec(Xgv,Ug,Vg,k);
    Xbr = rec(Xbv,Ub,Vb,k);
    Xar = revectorize(Xrr,8);
    Xag = revectorize(Xgr,8);
    Xab = revectorize(Xbr,8);
    Rr = multiply(Xar,8,r,c);
    Gr = multiply(Xag,8,r,c);
    Br = multiply(Xab,8,r,c);
    In(:,:,1) = Rr;
    In(:,:,2) = Gr;
    In(:,:,3) = Br;
    V = In-I;
    V = V.^2;
    e = sum(V,'all');
    Error = sqrt(e);
    Err(k) = Error;
end
K = [1:64];
figure;
plot(K,Err);
xlabel('K');
ylabel('Error');