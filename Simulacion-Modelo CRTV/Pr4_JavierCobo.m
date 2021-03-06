clear; close all; clc;

lambda1=1/3;
lambda2=1/4;
u1=2;
d1=0.5;
T=360;
u31=7;
d31=1;
u32=5;
d32=1;

tll1=0;
ts1=0;
ts2=0;

nele=10000;

for i=1:nele
    [Tp,tp_med_sistema,n_med_n1, n_med_n2, n_med_n3] = redColas(lambda1,lambda2,u1,d1,T,u31,d31,u32,d32);
    X(i,1)=Tp;
    X(i,2)=tp_med_sistema;
    X(i,3)=n_med_n1;
    X(i,4)=n_med_n2;
    X(i,5)=n_med_n3;
    
end

figure;
hist(X(:,1), 100)
title('Histograma Tp');

figure;
hist(X(:,2), 100)
title('Histograma tp med sistema');

figure;
hist(X(:,3), 100)
title('Histograma n med n1');

figure;
hist(X(:,4), 100)
title('Histograma n med n2');

figure;
hist(X(:,5), 100)
title('Histograma n med n3');




disp('Media Tp');
disp(mean(X(:,1)));

disp('Media tp med sistema');
disp(mean(X(:,2)));

disp('Media n med n1');
disp(mean(X(:,3)));

disp('Media n med n2');
disp(mean(X(:,4)));

disp('Media n med n3');
disp(mean(X(:,5)));



%[Tp,tp_med_sistema,n_med_n1, n_med_n2, n_med_n3] = redColas(lambda1,lambda2,u1,d1,T,u31,d31,u32,d32)

