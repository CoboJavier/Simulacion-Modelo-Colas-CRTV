function [n_med_n1,n1,t,NLL1,LL1,tll1,ts1] = llegada_cliente(tsuc,n_med_n1,n1,t,NLL1,LL1,lambda1,tll1,u1,d1,ts1,T)


n_med_n1=n_med_n1+n1*(tsuc-t);
n1=n1+1;
NLL1=NLL1+1;

LL1(NLL1)=tsuc;
t=tsuc;

Y=extraerExponencial(lambda1);

if (t+Y)< T
    tll1=t+Y;
end

if n1==1
   Y=extraerNormal(u1,d1);
   ts1=t+Y;
end

end

