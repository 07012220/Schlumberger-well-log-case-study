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


R0=0.3015, m=1.9, a=0.8;
Rt=R0, Rw=0.0395, Rsh=1.2218;
% k=find(MD1==2699.1);
% Rw=(phiE1(k)^m)*R0/a;
% %Rw=0.0395

%rhoM=2.65, rhoF=1
MD1=MD(MD>=2605 & MD<=2780);
k=find(MD==2605)-1;
i=1;
while i<=find(MD1==2780)
phiD1(i)=(2.65-DENSITY(i+k))/(2.65-1);
nphiD1(i)=NPHI(i+k);
VshND1(i)= (phiD1(i)-NPHI(i+k))/(0.097);
Igr1(i)=(GR(i)-2.720)/(125-2.720);
Vsh_stieber1(i)=Igr1(i)/(3-2*Igr1(i));
if VshND1(i)<Vsh_stieber1(i)
min_Vsh_NDstieber1(i)=VshND1(i);
else
min_Vsh_NDstieber1(i)=Vsh_stieber1(i);
end
phiS1(i)=(DT(i+k)-55.5)/(189-55.5);
phiDC1(i)=phiD1(i)-min_Vsh_NDstieber1(i)*0.039;
phiNC1(i)=nphiD1(i)-min_Vsh_NDstieber1(i)*0.1667;
phiE1(i)=(phiNC1(i)+phiDC1(i)+2*phiS1(i))/4;
M=min_Vsh_NDstieber1(i)^(1-(min_Vsh_NDstieber1(i))/2) / sqrt(Rsh);
Sw1(i)=( sqrt(Rt)*( M + (phiE1(i)^(m/2)/sqrt(a*Rw) )) )^(-1);
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
nphiD2(i)=NPHI(i+k);
VshND2(i)= (phiD2(i)-NPHI(i+k))/(0.097);
Igr2(i)=(GR(i)-2.720)/(125-2.720);
Vsh_stieber2(i)=Igr2(i)/(3-2*Igr2(i));
if VshND2(i)<Vsh_stieber2(i)
min_Vsh_NDstieber2(i)=VshND2(i);
else
min_Vsh_NDstieber2(i)=Vsh_stieber2(i);
end
phiS2(i)=(DT(i+k)-55.5)/(189-55.5);
phiDC2(i)=phiD2(i)-min_Vsh_NDstieber2(i)*0.039;
phiNC2(i)=nphiD2(i)-min_Vsh_NDstieber2(i)*0.1667;
phiE2(i)=(phiNC2(i)+phiDC2(i)+2*phiS2(i))/4;
M=min_Vsh_NDstieber2(i)^(1-(min_Vsh_NDstieber2(i))/2) / sqrt(Rsh);
Sw2(i)=( sqrt(Rt)*( M + (phiE2(i)^(m/2)/sqrt(a*Rw) )) )^(-1);
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
nphiD3(i)=NPHI(i+k);
VshND3(i)= (phiD3(i)-NPHI(i+k))/(0.097);
Igr3(i)=(GR(i)-2.720)/(125-2.720);
Vsh_stieber3(i)=Igr3(i)/(3-2*Igr3(i));
if VshND3(i)<Vsh_stieber3(i)
min_Vsh_NDstieber3(i)=VshND3(i);
else
min_Vsh_NDstieber3(i)=Vsh_stieber3(i);
end
phiS3(i)=(DT(i+k)-55.5)/(189-55.5);
phiDC3(i)=phiD3(i)-min_Vsh_NDstieber3(i)*0.039;
phiNC3(i)=nphiD3(i)-min_Vsh_NDstieber3(i)*0.1667;
phiE3(i)=(phiNC3(i)+phiDC3(i)+2*phiS3(i))/4;
M=min_Vsh_NDstieber3(i)^(1-(min_Vsh_NDstieber3(i))/2) / sqrt(Rsh);
Sw3(i)=( sqrt(Rt)*( M + (phiE3(i)^(m/2)/sqrt(a*Rw) )) )^(-1);
i=i+1;
end
% plot(VshND3,-MD3);
% xlabel('Calculated Vshale using ND log');
% ylabel('Measuring Depth (in m)');
% xlim([-0.5 1]);
% grid on;

% R0=0.3015, m=1.9, a=0.8;
% Rt=R0;
% k=find(MD1==2699.1);
% Rw=(phiE1(k)^m)*R0/a;
