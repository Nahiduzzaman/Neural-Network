x1 = [0 0 1 1];
x2 = [0 1 0 1];
p = [x1;x2];
x = p';

w = rand(2,1)'

%w = [0.2 0.5]
disp('Initial_weight:')

%d = [0 0 0 0]
%d = [0 0 0 1]
%d = [0 0 1 0]
%d = [0 0 1 1]
%d = [0 1 0 0]
%d = [0 1 0 1]
%d = [0 1 1 0] Failed!
%d = [0 1 1 1]

d = [0 1 1 1];
th = 0.5;
eta = 0.01;



update = 1;
iterate = 0;

while update == 1
    
    iterate = iterate+1
    
    
    s1 = w(1)*x1;
    s2 = w(2)*x2 ;
    s3 = s1+ s2;
    
    for j = 1:4
        if  s3(j) <= th
            y(j) = 0 ;
        else
            y(j) = 1 ;
        end
    end
    
    for i = 1:4
        Actual_Output_Set = y
        
        Desired_Output = d
        
        %-----------------------------------------
        if (y(i) == d(i))
            Current_Input = x(i,:)
            w = w+0
            
        elseif  ( y(i) == 0 && d(i) == 1 )
            Current_Input = x(i,:)
            w = w + eta*x(i,:)
            
        elseif ( y(i) == 1 && d(i) == 0 )
            Current_Input = x(i,:)
            w = w - eta*x(i,:)
            z = w
        end
        
        
    end
    
    if y == d
        update = 0;
    else
        
        update = 1;
    end
end                         % end of while

