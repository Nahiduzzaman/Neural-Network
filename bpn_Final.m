clearvars

%-----------------Initialization------------------
%{
x1 = [0 0 0 0 1 1 1 1]
x2 = [0 0 1 1 0 0 1 1]
x3 = [0 1 0 1 0 1 0 1]
%}

x1 = [0]
x2 = [0]        
x3 = [1]

p = [x1;x2;x3];
x=p';

t = [0.0 0.0 1.0];   %terget output

k1 = 0.3;
eta1 = 0.5;
uhj = [0.7 0.8];
w1 = [0.2 0.1];
w2 = [0.3 0.9];
w3 = [0.4 0.8];
q = [w1,w2,w3];
Wij = q;

k2 = 0.1;
eta2 = 0.2;
uOk = [0.5 0.6 0.4];
w4 = [0.1 0.2 0.8];
w5 = [0.6 0.3 0.4];
r = [w4,w5];
Wjk = r;

%-------------------Learning-----------------------

update = 1;
iterate = 0;

while update == 1
    
    iterate = iterate+1
    %------------- Layer J---------------------
    net_j1 = Wij(1)*x1 + Wij(3)*x2 + Wij(5)*x3 ;
    net_j2 = Wij(2)*x1 + Wij(4)*x2 + Wij(6)*x3 ;
    
    active_j1 = net_j1 + uhj(1) ;
    active_j2 = net_j2 + uhj(2) ;
    
    Oj1 = (1+(exp(1).^(-k1*active_j1))).^-1;
    Oj2 = (1+(exp(1).^(-k1*active_j2))).^-1;
    Oj = [Oj1;Oj2]
    
    %-------------- Layer K--------------------
    net_k1 = Wjk(1)*Oj1 + Wjk(4)*Oj2;
    net_k2 = Wjk(2)*Oj1 + Wjk(5)*Oj2;
    net_k3 = Wjk(3)*Oj1 + Wjk(6)*Oj2;
    
    active_k1 = net_k1 + uOk(1);
    active_k2 = net_k2 + uOk(2);
    active_k3 = net_k3 + uOk(3);
    
    Ok1 = (1+(exp(1).^(-k2*active_k1))).^-1;
    Ok2 = (1+(exp(1).^(-k2*active_k2))).^-1;
    Ok3 = (1+(exp(1).^(-k2*active_k3))).^-1;
    
    Ok = [Ok1;Ok2;Ok3]
    %-----------------Error--------------------
    
    d1 = t(1) - Ok1;
    d2 = t(2) - Ok2;
    d3 = t(3) - Ok3;
    d = [d1 d2 d3];
    %dT = (d1+d2+d3)/3
    dT = 0.5*(d1.^2 + d2.^2 + d3.^2)

    
    %----------------- adjustment--------------
    
    if dT <= 0.01
        update = 0;
    else
        c=0;
        for i = 1:2
            for j = 1:3
                c=c+1;
                dWjk(c) = eta2*k2*d(j)*Oj(i)*Ok(j)*(1-Ok(j));
            end
        end
        
        for k = 1:6
            Wjk(k) = Wjk(k) + dWjk(k);
        end
        
        Wjk
        
        for m = 1:3
            duOk(m) = eta2*k2*d(m)*Ok(m)*(1-Ok(m));
            uOk(m) = uOk(m) + duOk(m);
        end
        uOk
        
        
        a=0;
        for n = 1:3
            for v = 1:2
                a=a+1;
                dWij(a) = eta1*k1*x(n)*Oj(v)*(1-Oj(v))*sum(d(n)*Wjk);
            end
        end
        
        for b = 1:6
            Wij(b) = Wij(b) + dWij(b);
        end
        
        Wij
        
        
        for f=1:2
            duhj(f) = eta1*k1*Oj(f)*(1-Oj(f))*sum(d(n)*Wjk);
            uhj(f) = uhj(f) + duhj(f);
        end
        uhj
        update =1;
    end
end


