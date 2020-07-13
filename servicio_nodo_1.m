function [tsuc,n_med_n1,n1,t,Ns1,S1,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1] = servicio_nodo_1(tsuc,n_med_n1,n1,t,Ns1,S1,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1)

n_med_n1=n_med_n1+n1*(tsuc-t);
n1=n1-1;

Ns1=Ns1+1;
S1(Ns1)=tsuc;

U=rand;

if U <= 0.4
    n_med_n2=n_med_n2+n2*(tsuc-t);
    n2=n2+1;
    NLL2=NLL2+1;
    LL2(NLL2)=tsuc;
    if n2==1
        Z=extraerExponencial(lambda2);
        ts2=tsuc+Z;
          
    end
else
    n_med_n3=n_med_n3+n3*(tsuc-t);
    n3=n3+1;
    NLL3=NLL3+1;
    LL3(NLL3)=tsuc;
    if n3==1
        W=extraerNormal(u31,d31);
        ts3=tsuc+W;
          
    end
end
t=tsuc;
if n1>0
    S=extraerNormal(u1,d1);
    ts1=t+S;
end

end

