function [tsuc,t,Ns3,S3,n_med_n3,n3,ts3] = servicio_nodo_3(tsuc,n_med_n1,n1,t,Ns3,S3,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1,u32,d32)

n_med_n3=n_med_n3+n3*(tsuc-t);
n3=n3-1;

Ns3=Ns3+1;
S3(Ns3)=tsuc;

if n3>0
    if n3<5
        R=extraerNormal(u31,d31);
    else
       R=extraerNormal(u32,d32); 
    end
    ts3=tsuc+R;
end
t=tsuc;
end



