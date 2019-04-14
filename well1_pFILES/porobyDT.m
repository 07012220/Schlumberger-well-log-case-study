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

%DTmatrix=55.5, DTfluid=189
MD1=MD(MD>=2605 & MD<=2780);
k=find(MD==2605)-1;
i=1;
while i<=find(MD1==2780)
phiS1(i)=(DT(i+k)-55.5)/(189-55.5);
i=i+1;
end

% plot(phiS1,-MD1);
% xlabel('Calculated phi-Sonic using DT log');
% ylabel('Measuring Depth (in m)');
% xlim([0 1]);
% grid on;
 
MD2=MD(MD>=2780 & MD<=3050);
k=find(MD==2780)-1;
i=1;
while i<=find(MD2==3050)
phiS2(i)=(DT(i+k)-55.5)/(189-55.5);
i=i+1;
end
% plot(phiS2,-MD2);
% xlabel('Calculated phi-Sonic using DT log');
% ylabel('Measuring Depth (in m)');
% xlim([0 1]);
% grid on;

MD3=MD(MD>=3350 & MD<=3500);
k=find(MD==3350)-1;
i=1;
while i<=find(MD3==3500)
phiS3(i)=(DT(i+k)-55.5)/(189-55.5);
i=i+1;
end
plot(phiS3,-MD3);
xlabel('Calculated phi-Sonic using DT log');
ylabel('Measuring Depth (in m)');
xlim([0 1]);
grid on;
