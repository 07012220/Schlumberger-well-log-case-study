clear all
close all
clc
M=importdata('well1.las');

MD=M(:,1);
BITSIZE=M(:,2);
CALI=M(:,3);
DENSITY=M(:,4);
DT=M(:,5);
GR=M(:,6);
NPHI=M(:,7);
RS=M(:,8);
RT=M(:,9);

i=1
while i<10202
Vsh(i)=Igr(i)/(3-2*Igr(i));
i=i+1;
end

plot(Vsh,-MD);
grid on;
xlim([-1 1.5]);
ylabel('Measuring Depth (in m)');
xlabel('Vsh(stieber)');
