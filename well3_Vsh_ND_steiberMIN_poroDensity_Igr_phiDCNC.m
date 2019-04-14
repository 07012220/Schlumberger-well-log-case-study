clear all
close all
clc
M=importdata('well.las');

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

layer1_min=2605, layer1_max=2794;
layer2_min=2795, layer2_max=3312;
layer3_min=3588, layer3_max=3650;

layer4_min=3668, layer4_max=3710;

GR_max=98.408, GR_min=0.045;
phi_nsh=0.416;phi_dsh=0.218;
phi_M1=2.65,phi_M2=2.6,phi_F=1;
DT_m=55.5,DT_f=189;

R0=0.279, m=2.15, a=0.62;
Rt=R0, Rw=0.0468, Rsh=1.949,Rmf=0.0186;
F1=0,F2=0,F3=0,F11=0,F22=0,F33=0;

%rhoM=2.65, rhoF=1
MD1=MD(MD>=layer1_min & MD<=layer1_max);
k=find(MD==layer1_min)-1;
i=1;
while i<=find(MD1==layer1_max)
phiD1(i)=(phi_M1-DENSITY(i+k))/(phi_M1-phi_F);
nphiD1(i)=NPHI(i+k);
VshND1(i)= (NPHI(i+k)-phiD1(i))/(phi_nsh-phi_dsh);
Igr1(i)=(GR(i)-GR_min)/(GR_max-GR_min);
% Vsh_stieber1(i)=Igr1(i)/(3-2*Igr1(i));
% if VshND1(i)<Vsh_stieber1(i)
% Igr1(i)=VshND1(i);
% else
% Igr1(i)=Vsh_stieber1(i);
% end
phiS1(i)=(DT(i+k)-DT_m)/(DT_f-DT_m);
phiDC1(i)=phiD1(i)-Igr1(i)*phi_dsh;
phiNC1(i)=nphiD1(i)-Igr1(i)*phi_nsh;
phiE1(i)=(phiNC1(i)+phiDC1(i)+2*phiS1(i))/4;
if phiE1(i)<0
phiE1(i)=0;
end
M=Igr1(i)^(1-(Igr1(i))/2) / sqrt(Rsh);
%Sw1(i)=( sqrt(Rt)*( M + (phiE1(i)^(m/2)/sqrt(a*Rw) )) )^(-1);
RS1(i)=RS(i+k);
RT1(i)=RT(i+k);
Sw1(i)=(1-Igr1(i))*a*Rw*(1/RT1(i)-Igr1(i)/Rsh)/phiE1(i);
Sw1(i)=sqrt(Sw1(i));
perm1(i)=sqrt(a/phiE1(i)^m)*( sqrt(Rmf/RS1(i)) - sqrt(Rw/RT1(i)) );


if imag(Sw1(i))~= 0
Sw1(i)=0;
end
if ((Igr1(i) < 0.45 & Igr1(i)>0.15) & (phiE1(i)>0.01 & phiE1(i)<0.16) &(Sw1(i)>0.1 & Sw1(i)<0.7))
Igr1I(i)=Igr1(i);
phiE1I(i)=phiE1(i);
Sw1I(i)=Sw1(i);
MD1I(i)=MD(i);
else
Igr1I(i)=0;
phiE1I(i)=0;
Sw1I(i)=0;
MD1I(i)=0;
end
F1=F1+phiE1I(i)*(1-Sw1I(i));
F11=F11+phiE1(i)*(1-Sw1(i));
HIIP1=8*(layer1_max-layer1_min)*(F1/F11)*mean(phiE1(i))*mean((1-Sw1(i)))/1.13;
perm1(i)=-perm1(i);
i=i+1;
end

% k=find(MD1==2740.9);
% Rw=(phiE1(k)^m)*R0/a;
% %Rw=0.0468
% 
% plot(VshND1,-MD1);
% xlabel('Calculated Vshale using ND log');
% xlim([0 1]);

% plot(Igr1,-MD1);
% xlabel('I-(GR)');
% xlim([-1 1.5]);

% plot(phiDC1,-MD1);
% xlabel('Shale corrected density porosity');
% xlim([0 1]);

% plot(phiNC1,-MD1);
% xlabel('Shale corrected NPHI porosity');
% xlim([0 1]);
% 
% plot(phiE1,-MD1);
% xlabel('Effective Porosity');
% xlim([0 1]);


% plot(phiS1,-MD1);
% xlabel('Calculated phi-sonic using DT log');
% xlim([0 1]);
% 
% plot(phiD1,-MD1);
% xlabel('Calculated Porosity using density log');
% xlim([-1 1]);

% plot(Sw1,-MD1);
% xlabel('saturation');
% xlim([0 1]);

plot(perm1,-MD1);
xlabel('Sxo-Sw');
xlim([0 1]);

%rhoM=2.16, rhoF=1
MD2=MD(MD>=layer2_min & MD<=layer2_max);
k=find(MD==layer2_min)-1;
i=1;
while i<=find(MD2==layer2_max)
phiD2(i)=(phi_M2-DENSITY(i+k))/(phi_M2-phi_F);
nphiD2(i)=NPHI(i+k);
VshND2(i)= (NPHI(i+k)-phiD2(i))/(phi_nsh-phi_dsh);
Igr2(i)=(GR(i)-GR_min)/(GR_max-GR_min);
% Vsh_stieber2(i)=Igr2(i)/(3-2*Igr2(i));
% if VshND2(i)<Vsh_stieber2(i)
% Igr2(i)=VshND2(i);
% else
% Igr2(i)=Vsh_stieber2(i);
% end
phiS2(i)=(DT(i+k)-DT_m)/(DT_f-DT_m);
phiDC2(i)=phiD2(i)-Igr2(i)*phi_dsh;
phiNC2(i)=nphiD2(i)-Igr2(i)*phi_nsh;
phiE2(i)=(phiNC2(i)+phiDC2(i)+2*phiS2(i))/4;
if phiE2(i)<0
phiE2(i)=0;
end
M=Igr2(i)^(1-(Igr2(i))/2) / sqrt(Rsh);
%Sw2(i)=( sqrt(Rt)*( M + (phiE2(i)^(m/2)/sqrt(a*Rw) )) )^(-1);
RS2(i)=RS(i+k);
RT2(i)=RT(i+k);
Sw2(i)=(1-Igr2(i))*a*Rw*(1/RT2(i)-Igr2(i)/Rsh)/phiE2(i);
Sw2(i)=sqrt(Sw2(i));
perm2(i)=sqrt(a/phiE2(i)^m)*( sqrt(Rmf/RS2(i)) - sqrt(Rw/RT2(i)) );

if imag(Sw2(i))~= 0
Sw2(i)=0;
end
if ((Igr2(i) < 0.45 & Igr2(i)>0.25) & (phiE2(i)>0.02 & phiE2(i)<0.26) &(Sw2(i)>0.2 & Sw2(i)<0.7))
Igr2I(i)=Igr2(i);
phiE2I(i)=phiE2(i);
Sw2I(i)=Sw2(i);
MD2I(i)=MD(i);
else
Igr2I(i)=0;
phiE2I(i)=0;
Sw2I(i)=0;
MD2I(i)=0;
end
F2=F2+phiE2I(i)*(1-Sw2I(i));
F22=F22+phiE2(i)*(1-Sw2(i));
i=i+1;
end


% plot(VshND2,-MD2);
% xlabel('Calculated Vshale using ND log');
% xlim([0 1]);
% 
% plot(Igr2,-MD2);
% xlabel('I-(GR)');
% xlim([-1 1.5]);

% plot(phiDC2,-MD2);
% xlabel('Shale corrected density porosity');
% xlim([-0.2 1]);

% plot(phiNC2,-MD2);
% xlabel('Shale corrected NPHI porosity');
% xlim([-0.2 1]);

% plot(phiE2,-MD2);
% xlabel('Effective Porosity');
% xlim([0 1]);

% 
% plot(phiS2,-MD2);
% xlabel('Calculated phi-sonic using DT log');
% xlim([0 1]);

% plot(phiD2,-MD2);
% xlabel('Calculated Porosity using density log');
% xlim([-.3 .3]);

% plot(-perm2,-MD2);
% xlabel('Sxo-Sw');
% xlim([-1 1]);

% plot(Sw2,-MD2);
% xlabel('saturation');
% xlim([0 1]);


MD3=MD(MD>=layer3_min & MD<=layer3_max);
k=find(MD==layer3_min)-1;
i=1;
while i<=find(MD3==layer3_max)
phiD3(i)=(phi_M1-DENSITY(i+k))/(phi_M1-phi_F);
nphiD3(i)=NPHI(i+k);
VshND3(i)= (NPHI(i+k)-phiD3(i))/(phi_nsh-phi_dsh);
Igr3(i)=(GR(i)-GR_min)/(GR_max-GR_min);
if Igr3(i) > 1
Igr3=0.9;
end
% Vsh_stieber3(i)=Igr3(i)/(3-2*Igr3(i));
% if VshND3(i)<Vsh_stieber3(i)
% Igr3(i)=VshND3(i);
% else
% Igr3(i)=Vsh_stieber3(i);
% end
phiS3(i)=(DT(i+k)-DT_m)/(DT_f-DT_m);
phiDC3(i)=phiD3(i)-Igr3(i)*phi_dsh;
phiNC3(i)=nphiD3(i)-Igr3(i)*phi_nsh;
%phiE3(i)=(phiNC3(i)+phiDC3(i)+2*phiS3(i))/4;
phiE3(i)=(7*phiD3(i)+2*nphiD3(i)+9*phiS3(i))/18;
% if phiE3(i)<0
% phiE3(i)=-phiE3(i);
% end
M=Igr3(i)^(1-(Igr3(i))/2) / sqrt(Rsh);
%Sw3(i)=( sqrt(Rt)*( M + (phiE3(i)^(m/2)/sqrt(a*Rw) )) )^(-1);
RS3(i)=RS(i+k);
RT3(i)=RT(i+k);
Sw3(i)=(1-Igr3(i))*a*Rw*(1/RT3(i)-Igr3(i)/Rsh)/phiE3(i);
Sw3(i)=sqrt(Sw3(i));
perm3(i)=sqrt(a/phiE3(i)^m)*( sqrt(Rmf/RS3(i)) - sqrt(Rw/RT3(i)) );


if imag(Sw3(i))~= 0
Sw3(i)=0;
end
if ((Igr3(i) < 0.45 & Igr3(i)>0.35) & (phiE3(i)>0.03 & phiE3(i)<0.36) &(Sw3(i)>0.1 & Sw3(i)<0.7))
Igr3I(i)=Igr3(i);
phiE3I(i)=phiE3(i);
Sw3I(i)=Sw3(i);
MD3I(i)=MD(i);
else
Igr3I(i)=0;
phiE3I(i)=0;
Sw3I(i)=0;
MD3I(i)=0;
end
F3=F3+phiE3I(i)*(1-Sw3I(i));
F33=F33+phiE3(i)*(1-Sw3(i));
HIIP3=8*(layer3_max-layer3_min)*(F3/F33)*mean(phiE3(i))*mean((1-Sw3(i)))/1.13;
i=i+1;
end

% plot(VshND3,-MD3);
% xlabel('Calculated Vshale using ND log');
% xlim([0 1]);

% plot(Igr3,-MD3);
% xlabel('I-(GR)');
% xlim([-1 1.5]);

% plot(phiDC3,-MD3);
% xlabel('Shale corrected density porosity');
% xlim([0 1]);

% plot(phiNC3,-MD3);
% xlabel('Shale corrected NPHI porosity');
% xlim([0 1]);

% plot(phiE3,-MD3);
% xlabel('Effective Porosity');
% xlim([0 1]);


% plot(phiS3,-MD3);
% xlabel('Calculated phi-sonic using DT log');
% xlim([0 1]);

% plot(phiD3,-MD3);
% xlabel('Calculated Porosity using density log');
% xlim([-1 1]);
% 
% plot(-perm3,-MD3);
% xlabel('Sxo-Sw');
% xlim([-1 1]);
% 
% Sw3=Sw3';
% plot(Sw3,-MD3);
% xlabel('saturation');
%xlim([-1 1]);



% R0=0.3015, m=1.9, a=0.8;
% Rt=R0;
% k=find(MD1==2699.1);
% Rw=(phiE1(k)^m)*R0/a;

MD4=MD(MD>=layer4_min & MD<=layer4_max);
k=find(MD==layer4_min)-1;
i=1;
while i<=find(MD4==layer4_max)
phiD4(i)=(phi_M1-DENSITY(i+k))/(phi_M1-phi_F);
nphiD4(i)=NPHI(i+k);
VshND4(i)= (NPHI(i+k)-phiD4(i))/(phi_nsh-phi_dsh);
Igr4(i)=(GR(i)-GR_min)/(GR_max-GR_min);
if Igr4(i) > 1
Igr4=0.9;
end
% Vsh_stieber4(i)=Igr4(i)/(4-2*Igr4(i));
% if VshND4(i)<Vsh_stieber4(i)
% Igr4(i)=VshND4(i);
% else
% Igr4(i)=Vsh_stieber4(i);
% end
phiS4(i)=(DT(i+k)-DT_m)/(DT_f-DT_m);
phiDC4(i)=phiD4(i)-Igr4(i)*phi_dsh;
phiNC4(i)=nphiD4(i)-Igr4(i)*phi_nsh;
%phiE4(i)=(phiNC4(i)+phiDC4(i)+2*phiS4(i))/4;
phiE4(i)=(7*phiD4(i)+2*nphiD4(i)+9*phiS4(i))/18;
% if phiE4(i)<0
% phiE4(i)=-phiE4(i);
% end
M=Igr4(i)^(1-(Igr4(i))/2) / sqrt(Rsh);
%Sw4(i)=( sqrt(Rt)*( M + (phiE4(i)^(m/2)/sqrt(a*Rw) )) )^(-1);
RS4(i)=RS(i+k);
RT4(i)=RT(i+k);
Sw4(i)=(1-Igr4(i))*a*Rw*(1/RT4(i)-Igr4(i)/Rsh)/phiE4(i);
Sw4(i)=sqrt(Sw4(i));

perm4(i)=sqrt(a/phiE4(i)^m)*( sqrt(Rmf/RS4(i)) - sqrt(Rw/RT4(i)) );
i=i+1;
end
% Sw3=Sw3';
% plot(Sw4,-MD4);
% xlabel('Saturation');
%xlim([-1 1]);
% 
% ylabel('Measuring Depth (in m)');
% grid on;

phiE1=phiE1';
phiE2=phiE2';
phiE3=phiE3';