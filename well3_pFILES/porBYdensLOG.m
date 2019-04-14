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

% %rhoM=2.65, rhoF=1
% MD1=MD(MD>=2600 & MD<=2800);
% k=find(MD==2600)-1;
% i=1;
% while i<=find(MD1==2800)
% phiD1(i)=(2.65-DENSITY(i+k))/(2.65-1);
% i=i+1;
% end
% plot(phiD1,-MD1);
% xlabel('Calculated Porosity using density log');
% ylabel('Measuring Depth (in m)');
% xlim([0 1]);
% grid on;

%rhoM=2.16, rhoF=1
MD2=MD(MD>=2800 & MD<=3300);
k=find(MD==2800)-1;
i=1;
while i<=find(MD2==3300)
phiD2(i)=(2.16-DENSITY(i+k))/(2.16-1);
i=i+1;
end
plot(phiD2,-MD2);
xlabel('Calculated Porosity using density log');
ylabel('Measuring Depth (in m)');
xlim([-1 1]);
grid on;


% MD3=MD(MD>=3560 & MD<=3700);
% k=find(MD==3560)-1;
% i=1;
% while i<=find(MD3==3700)
% phiD3(i)=(2.65-DENSITY(i+k))/(2.65-1);
% i=i+1;
% end
% plot(phiD3,-MD3);
% xlabel('Calculated Porosity using density log');
% ylabel('Measuring Depth (in m)');
% xlim([-1 1]);
% grid on;
