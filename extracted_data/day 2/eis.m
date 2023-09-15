clc;

f =yogurttest7f;
z = yogurttest7Zc;
P = yogurttest7Pc;

R = (z).*cos(P.*(pi./180));
I = (z).*sin(P.*(pi./180));

p=150
% t = [ f,-I(1:p) ,R(1:p)];
% T = array2table(t,'VariableNames',{'w' 'I' 'R'});
% writetable(T,strcat('yogurt,'.csv'));


fileID = fopen(strcat('yogurt7','EIS.txt'),'wt');
fprintf(fileID,'%d \n',150);
for i=150:-1:1
fprintf(fileID,'%f %f %f \n',[R(i); abs(I(i)); f(i)]);
end
fclose(fileID);
plot (R,-I)