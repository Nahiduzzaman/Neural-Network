clear all;
p1 = [1 -1 1 -1];
p2 = [-1 -1 -1 -1];
p3 = [1 1 -1 1];
p4 = [1 1 1 1];
p = [p1;p2;p3;p4]

Wij = zeros(4);


for i = 1:4
    for j = 1:4
        if i==j
            Wij(i,j)=0;
        else
            Wij(i,j) = sum ( p(:,i).* p(:,j));
        end
    end
end


x = [1 1 -1 -1]';

%{
Wij =

     0     2     2     2
     2     0     0     4
     2     0     0     0
     2     4     0     0
%}

update = 1;
iterate = 0;


while update == 1
    
    iterate = iterate+1
    
    for k=1:4
        x
        Wij(:,k)
        W(k) = sum( Wij(:,k) .* x )
        if W(k) >= 0
            y(k) = 1;
        else
            y(k) = -1;
        end
          x(k)  = y(k)'
          e(k) = y(k)'
          T = ['----Loop ',num2str(k),' finished----'];
          disp(T);
    end
    x = e'
  
    if (iterate == 1000)  
        update = 0;
    else
        update = 1;
    end        
end
 