function [tsuc,t,Ns2,S2,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1] = servicio_nodo_2(tsuc,t,Ns2,S2,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1)

n_med_n2=n_med_n2+n2*(tsuc-t);
n2=n2-1;

Ns2=Ns2+1;
S2(Ns2)=tsuc;
if n2>0
    Y=extraerExponencial(lambda2);
    ts2=tsuc+Y;
end

n3=n3+1;
NLL3=NLL3+1;
LL3(NLL3)=tsuc;
if n3==1
    W=extraerNormal(u31,d31);
    ts3=tsuc+W;
end
t=tsuc;
end

