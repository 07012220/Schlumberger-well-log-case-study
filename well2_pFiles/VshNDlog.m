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

%rhoM=2.65, rhoF=1
MD1=MD(MD>=2605 & MD<=2780);
k=find(MD==2605)-1;
i=1;
while i<=find(MD1==2780)
phiD1(i)=(2.65-DENSITY(i+k))/(2.65-1);
VshND1(i)= (phiD1(i)-NPHI(i+k))/(0.097);
i=i+1;
end

% plot(VshND1,-MD1);
% xlabel('Calculated Vshale using ND log');
% ylabel('Measuring Depth (in m)');
% xlim([0 1]);
% grid on;

%rhoM=2.16, rhoF=1
MD2=MD(MD>=2780 & MD<=3050);
k=find(MD==2780)-1;
i=1;
while i<=find(MD2==3050)
phiD2(i)=(2.6-DENSITY(i+k))/(2.6-1);
VshND2(i)= (phiD2(i)-NPHI(i+k))/(0.097);
i=i+1;
end
% plot(VshND2,-MD2);
% xlabel('Calculated Vshale using ND log');
% ylabel('Measuring Depth (in m)');
% xlim([-2 2]);
% grid on;



MD3=MD(MD>=3350 & MD<=3500);
k=find(MD==3350)-1;
i=1;
while i<=find(MD3==3500)
phiD3(i)=(2.65-DENSITY(i+k))/(2.65-1);
VshND3(i)= (phiD3(i)-NPHI(i+k))/(0.097);
i=i+1;
end
plot(VshND3,-MD3);
xlabel('Calculated Vshale using ND log');
ylabel('Measuring Depth (in m)');
xlim([-0.5 1]);
grid on;
