clear all
close all
clc
M=importdata('well2.las');

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

%rhoM=2.65, rhoF=1
MD1=MD(MD>=2605 & MD<=2780);
k=find(MD==2605)-1;
i=1;
while i<=find(MD1==2780)
phiD1(i)=(2.65-DENSITY(i+k))/(2.65-1);
i=i+1;
end
% plot(phiD1,-MD1);
% xlabel('Calculated Porosity using density log');
% ylabel('Measuring Depth (in m)');
% xlim([0 1]);
% grid on;

rhoM=2.16, rhoF=1
MD2=MD(MD>=2780 & MD<=3100);
k=find(MD==2780)-1;
i=1;
while i<=find(MD2==3100)
phiD2(i)=(2.6-DENSITY(i+k))/(2.6-1);
i=i+1;
end
plot(phiD2,-MD2);
xlabel('Calculated Porosity using density log');
ylabel('Measuring Depth (in m)');
xlim([-.5 .5]);
grid on;


MD3=MD(MD>=3450 & MD<=3600);
k=find(MD==3450)-1;
i=1;
while i<=find(MD3==3600)
phiD3(i)=(2.65-DENSITY(i+k))/(2.65-1);
i=i+1;
end
plot(phiD3,-MD3);
xlabel('Calculated Porosity using density log');
ylabel('Measuring Depth (in m)');
xlim([-1 1]);
grid on;