clear all
close all
clc
M=importdata('well3.las');

MD=M(:,1);
BITSIZE=M(:,2);
CALI=M(:,3);
DENSITY=M(:,4);
DT=M(:,5);
DTS=M(:,6);
GR=M(:,7);
NPHI=M(:,8);
RS=M(:,9);
RT=M(:,10);
i=1
while i<11762
Vshale(i)=(GR(i)-min(GR))/(95-.8520);
i=i+1;
end

plot(Vshale,-MD);
grid on;
xlim([0 1.5]);
ylabel('Measuring Depth (in m)');
xlabel('V-shale');
