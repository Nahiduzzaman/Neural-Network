clear all;
total_distA = 0;
total_distB = 0;

disp('Enter number of pattern in Class A');
x = input('ClassA total pattern:');
disp('Enter number of pattern in Class B');
y = input('ClassB total patern:');
disp('Enter X and Y coordinate for pattern in Class A');
for i = 1:x
    fprintf('\n');
    P1 = ['pattern',num2str(i)];
    disp(P1);
    classA_x(i) = input('X-Coordinate:');
    classA_y(i) = input('Y-Coordinate:');
end


disp('Enter X and Y coordinate for pattern in Class B');
for i = 1:y
    fprintf('\n');
    P2 = ['pattern',num2str(i)];
    disp(P2);
    classB_x(i) = input('X-Coordinate:');
    classB_y(i) = input('Y-Coordinate:');
end
fprintf('\n');

disp('Enter X and Y coordinate for New pattern');
new_x = input('X-Coordinate:');
new_y = input('Y-Coordinate:');



for k = 1:x
    distA = (classA_x(k)-new_x)^2 + (classA_y(k)-new_y)^2;
    distA = sqrt(distA);
    total_distA = total_distA + distA;
    avgdistA = total_distA/x;
end
fprintf('\nDistance from ClassA of the New Pattern:%f\n',avgdistA);

for k = 1:y
    distB = (classB_x(k)-new_x)^2 + (classB_y(k)-new_y)^2;
    distB = sqrt(distB);
    total_distB = total_distB + distB;
    avgdistB = total_distB/y;
end
fprintf('\nDistance from ClassB of the New Pattern:%f\n',avgdistB);

if avgdistA < avgdistB
    fprintf('\n\nNew pattern is the member of classA\n');
else
    fprintf('\n\nNew pattern is the member of classB\n');
end









