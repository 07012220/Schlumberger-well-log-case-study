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

%phiDSH=0.039, phiNSH=0.1367
MD1=MD(MD>=2605 & MD<=2780);
k=find(MD==2605)-1;
i=1;
while i<=find(MD1==2780)
phiD1(i)=(2.65-DENSITY(i+k))/(2.65-1);
nphiD1(i)=NPHI(i+k);
phiS1(i)=(DT(i+k)-55.5)/(189-55.5);
VshND1(i)= (phiD1(i)-NPHI(i+k))/(0.097);
phiDC1(i)=phiD1(i)-VshND1(i)*0.039;
phiNC1(i)=nphiD1(i)-VshND1(i)*0.1367;
phiE1(i)=(phiNC1(i)+phiDC1(i)+2*phiS1(i))/4;
i=i+1;
end

% plot(phiE1,-MD1);
% xlabel('Effective Porosity');
% ylabel('Measuring Depth (in m)');
% xlim([0 1]);
% grid on;

MD2=MD(MD>=2780 & MD<=3050);
k=find(MD==2780)-1;
i=1;
while i<=find(MD2==3050)
phiD2(i)=(2.6-DENSITY(i+k))/(2.6-1);
nphiD2(i)=NPHI(i+k);
phiS1(i)=(DT(i+k)-55.5)/(189-55.5);
VshND2(i)= (phiD2(i)-NPHI(i+k))/(0.097);
phiDC2(i)=phiD2(i)-VshND2(i)*0.039;
phiNC2(i)=nphiD2(i)-VshND2(i)*0.1367;
phiS2(i)=(DT(i+k)-55.5)/(189-55.5);
phiE2(i)=(phiNC2(i)+phiDC2(i)+2*phiS2(i))/4;
i=i+1;
end
plot(phiE2,-MD2);
xlabel('Effective Porosity');
ylabel('Measuring Depth (in m)');
xlim([0 0.4]);
grid on;


MD3=MD(MD>=3350 & MD<=3500);
k=find(MD==3350)-1;
i=1;
while i<=find(MD3==3500)
phiD3(i)=(2.65-DENSITY(i+k))/(2.65-1);
nphiD3(i)=NPHI(i+k);
phiS1(i)=(DT(i+k)-55.5)/(189-55.5);
VshND3(i)= (phiD3(i)-NPHI(i+k))/(0.097);
phiDC3(i)=phiD3(i)-VshND3(i)*0.039;
phiNC3(i)=nphiD3(i)-VshND3(i)*0.1367;
phiS3(i)=(DT(i+k)-55.5)/(189-55.5);
phiE3(i)=(phiNC3(i)+phiDC3(i)+2*phiS3(i))/4;
i=i+1;
end
% plot(phiE3,-MD3);
% xlabel('Effective Porosity');
% ylabel('Measuring Depth (in m)');
% xlim([0 0.4]);
% grid on;
