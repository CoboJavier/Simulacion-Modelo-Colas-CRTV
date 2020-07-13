function F =  extraerNormal(u,sigma)

y=extraerNormalEstandar;
x=u+sigma*y; 

while x < 0
    y=extraerNormalEstandar;
    x=u+sigma*y;    
end

F=x;


end

