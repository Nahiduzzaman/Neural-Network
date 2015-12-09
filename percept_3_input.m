x1 = [0 0 0 0 1 1 1 1];
x2 = [0 0 1 1 0 0 1 1];
x3 = [0 1 0 1 0 1 0 1];
p = [x1;x2;x3];
x = p';

w = rand(3,1)'
%w = [0.0 0.0 0.0]
%w = [0.4    0.3    1.4]
disp('Initial_weight:')
%w = ww'
%d = [0 0 1 1]
%d = [0 1 0 1]
%d = [0 1 1 1]
%d = [0 0 0 0 1 1 1 1];
%d = [0 1 1 1 1 1 1 1];
%d = [0 1 0 0 1 1 1 1];
%d = [0 1 0 1 1 1 1 1];
%d = [0 0 1 0 1 1 1 1];
%d = [0 1 0 1 0 1 0 1];
%d = [0 1 1 1 0 1 1 1];
%d = [0 0 0 1 0 1 1 1]; Shakey!
d = [0 1 1 1 1 1 1 1];

th = 0.5;

update = 1;
iterate = 0;
while update == 1
    %for i = 1:4
    iterate = iterate+1
    
    % flag = flag+1
    
    s1 = w(1)*x1;
    s2 = w(2)*x2;
    s3 = w(3)*x3;
    s3 = s1+ s2 +s3;
    
    for j = 1:8
        if  s3(j) <= th
            y(j) = 0 ;
        else
            y(j) = 1 ;
        end
    end
    
    for i = 1:8
        Actual_Output_Set = y
        
        Desired_Output = d
        
        %-----------------------------------------
        if (y(i) == d(i))
            Current_Input = x(i,:)
            w = w+0
            
            
        elseif  ( y(i) == 0 && d(i) == 1 )
            Current_Input = x(i,:)
            w = w + x(i,:)
            
        elseif ( y(i) == 1 && d(i) == 0 )
            Current_Input = x(i,:)
            w = w - x(i,:)
            z = w
        end
        
        
    end
    
    if y == d
        update = 0;
    else
        
        update = 1;
    end
end % end of while

