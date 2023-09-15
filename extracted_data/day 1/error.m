%clear all;
close all;
name = 'S5_' 
datafile= strcat(name,'.txt') 
points = 122;
datafile= strcat(name,'.txt') 


points = 122; %The number of points to be read from the file and exracted.
fileID=fopen(datafile);
% formatSpec = '%s \n';
% sizeA = [1 148];
% S = fscanf(fileID,formatSpec,sizeA); 
formatSpec = '%f %f %f %f %f %f %f %f %f';
sizeA = [9 122];
A1 = fscanf(fileID,formatSpec,sizeA);
F_=log(S5f)
f_=S5f
f = A1(2,:)';
z = A1(5,:)';
P = A1(6,:)';
F = log(f)
Z=zeros(122)
[Zfit, gof] = createFit(F, z)
[Pfit, gof1] = createFit(F, P)
for i=1:134
    Zfitted(i)=Zfit(F_(i))
end
for i=1:134
    Pfitted(i)=Pfit(F_(i))
end
Perror=100*(Pfitted'-S5Pc)./Pfitted'
Zerror=100*(Zfitted'-S5Zc)./Zfitted'
subplot(2,2,1)
semilogx(f,z,'r-',S5f,Zfitted,'*', S5f,S5Zc)
xlabel('Frequency (HZ)')
ylabel('Impedance Magnitude')
legend('N4L','N4L interpolated','Our device')
subplot(2,2,2)
semilogx(S5f,Zerror)
xlabel('Frequency (HZ)')
ylabel('Error (%)')
subplot(2,2,3)
semilogx(f,P,'r-',S5f,Pfitted,'*', S5f,S5Pc)
xlabel('Frequency (HZ)')
ylabel('Impedance Phase')
legend('N4L','N4L interpolated','Our device')
subplot(2,2,4)
semilogx(S5f,Perror)
xlabel('Frequency (HZ)')
ylabel('Error (%)')
t = [ f_,Zfitted',Pfitted', Zerror,Perror];
T = array2table(t,'VariableNames',{ 'f' 'ZN4L' 'PN4l' 'Perror' 'Zerror'});
writetable(T,strcat(name,'error.csv'));
