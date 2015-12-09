clearvars
x1 = [0 0 1 1]
x2 = [0 1 0 1]
p = [x1;x2]
x = p'
w = [0.5070    0.9134]
%d = [0 1 1 1]

th = 0.1

s1 = w(1)*x1
s2 = w(2)*x2

s3 = s1+ s2

for i = 1:4
    if  s3(i) <= th
        y(i) = 0 ;
    else
        y(i) = 1 ;
    end
end

y

