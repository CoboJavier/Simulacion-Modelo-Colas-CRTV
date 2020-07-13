function [Tp,tp_med_sistema,n_med_n1, n_med_n2, n_med_n3] = redColas(lambda1,lambda2,u1,d1,T,u31,d31,u32,d32)

t=0;
tsuc=0;
Tp=0;

NLL1=0;
NLL2=0;
NLL3=0;

Ns1=0;
Ns2=0;
Ns3=0;

n1=0;
n2=0;
n3=0;

tll1=inf;
ts1=inf;
ts2=inf;
ts3=inf;

LL1=[];
LL2=[];
LL3=[];

S1=[];
S2=[];
S3=[];

%Serv=[];

n_med_n1=0;
n_med_n2=0;
n_med_n3=0;

X=extraerExponencial(lambda1);

if X>T
    
    Tp=0;
    tp_med_sistema=0;
    n_med_n1=0;
    n_med_n2=0;
    n_med_n3=0;
      
    return;
else
    
    [n_med_n1,n1,t,NLL1,LL1,tll1,ts1] = llegada_cliente(X,n_med_n1,n1,t,NLL1,LL1,lambda1,tll1,u1,d1,ts1,T);
    
    while tll1 ~= inf || ts1 ~= inf || ts2 ~= inf || ts3 ~= inf
        
        %disp('While');
        if min([tll1,ts1,ts2,ts3]) == tll1
            
            %disp('1');
            tsuc=tll1;
            tll1=inf;
            
            [n_med_n1,n1,t,NLL1,LL1,tll1,ts1] = llegada_cliente(tsuc,n_med_n1,n1,t,NLL1,LL1,lambda2,tll1,u1,d1,ts1,T);
        end
        
        if min([tll1,ts1,ts2,ts3]) == ts1
            %disp('2');
            tsuc=ts1;
            ts1=inf;
            [tsuc,n_med_n1,n1,t,Ns1,S1,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1] = servicio_nodo_1(tsuc,n_med_n1,n1,t,Ns1,S1,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1);
        end
        
        if min([tll1,ts1,ts2,ts3]) == ts2
            %disp('3');
            tsuc=ts2;
            ts2=inf;
            [tsuc,t,Ns2,S2,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1] = servicio_nodo_2(tsuc,t,Ns2,S2,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1);
        end
        
        if min([tll1,ts1,ts2,ts3]) == ts3
            %disp('4');
            tsuc=ts3;
            ts3=inf;
            [tsuc,t,Ns3,S3,n_med_n3,n3,ts3] = servicio_nodo_3(tsuc,n_med_n1,n1,t,Ns3,S3,n_med_n2,n2,NLL2,LL2,lambda2,ts2,n_med_n3,n3,NLL3,LL3,u31,d31,ts3,u1,d1,ts1,u32,d32);
        end
    end
    
Tp=max(0,(t-T));
acumulo1=0;
acumulo2=0;
acumulo3=0;
ind=1;
while ind < NLL1
    acumulo1=acumulo1+S1(ind)-LL1(ind);
    ind=ind+1;
end

ind=1;
while ind < NLL2
    acumulo2=acumulo2+S2(ind)-LL2(ind);
    ind=ind+1;
end

ind=1;
while ind < NLL2
    acumulo3=acumulo3+S3(ind)-LL3(ind);
    ind=ind+1;
end

tp_med_sistema=(acumulo1/NLL1)+(0.4*acumulo2/NLL2)+(acumulo3/NLL3);
n_med_n1=n_med_n1/t;
n_med_n2=n_med_n2/t;
n_med_n3=n_med_n3/t;


end %%FIN IF


end

