clear all
close all
clc
M=importdata('well.las');

MD=M(:,1);
BITSIZE=M(:,2);
CALI=M(:,3);
DENSITY=M(:,4);
DT=M(:,5);
GR=M(:,6);
NPHI=M(:,7);
RS=M(:,8);
RT=M(:,9);

layer1_min=2620, layer1_max=2780;
layer2_min=2781, layer2_max=3050;
layer3_min=3350, layer3_max=3500;
GR_min=0.0463, GR_max=125.3615;
phi_nsh=0.1667;phi_dsh=0.039;
phi_M1=2.65,phi_M2=2.6,phi_F=1;
DT_m=55.5,DT_f=189;

R0=0.3015, m=1.9, a=0.8;
Rt=R0, Rw=0.0395, Rsh=1.9392, Rmf=0.0359;;
% k=find(MD1==2699.1);
% Rw=(phiE1(k)^m)*R0/a;
% %Rw=0.0395

%rhoM=2.65, rhoF=1
MD1=MD(MD>=layer1_min & MD<=layer1_max);
k=find(MD==layer1_min)-1;
i=1;
while i<=find(MD1==layer1_max)
phiD1(i)=(phi_M1-DENSITY(i+k))/(phi_M1-phi_F);
nphiD1(i)=NPHI(i+k);
VshND1(i)= (NPHI(i+k)-phiD1(i))/(phi_nsh-phi_dsh);
Igr1(i)=(GR(i)-GR_min)/(GR_max-GR_min);
Vsh_stieber1(i)=Igr1(i)/(3-2*Igr1(i));
% if VshND1(i)<Vsh_stieber1(i)
% Vsh_stieber1(i)=VshND1(i);
% else
% Vsh_stieber1(i)=Vsh_stieber1(i);
% end
phiS1(i)=(DT(i+k)-DT_m)/(DT_f-DT_m);
phiDC1(i)=phiD1(i)-Vsh_stieber1(i)*phi_dsh;
phiNC1(i)=nphiD1(i)-Vsh_stieber1(i)*phi_nsh;
phiE1(i)=(phiNC1(i)+phiDC1(i)+2*phiS1(i))/4;
RS1(i)=RS(i+k);
RT1(i)=RT(i+k);
M=(Vsh_stieber1(i)^(1-(Vsh_stieber1(i))/2) )/ sqrt(Rsh);
D=(phiE1(i)^(m/2)/sqrt(a*Rw) );
C=sqrt(RT1(i));
Sw1(i)=(( C )*( M + D) )^(-1);
%Sw1(i)=( sqrt(RT1(i))*( M + (phiE1(i)^(1.9/2)/sqrt(0.8*0.0395) )) )^(-1);
perm1(i)=sqrt(a/(phiE1(i)^m))*( sqrt(Rmf/RS1(i)) - sqrt(Rw/RT1(i)) );
% if D<0
% display("AAAAAAAAAAAAAAAA");
% end
i=i+1;
end
% 
% plot(VshND1,-MD1);
% xlabel('Calculated Vshale using ND log');
% xlim([0 1]);
% 
% plot(Igr1,-MD1);
% xlabel('I-(GR)');
% xlim([-1 1.5]);
% 
% plot(phiDC1,-MD1);
% xlabel('Shale corrected density porosity');
% xlim([0 1]);
% 
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

% plot(phiD1,-MD1);
% xlabel('Calculated Porosity using density log');
% xlim([-1 1]);
% 
% plot(perm1,-MD1);
% xlabel('Sxo-Sw');
% xlim([-1 1]);
% 
% plot(Sw1,-MD1);
% xlabel('Water Saturation');
% xlim([0 1]);

%rhoM=2.16, rhoF=1
MD2=MD(MD>=layer2_min & MD<=layer2_max);
k=find(MD==layer2_min)-1;
i=1;
while i<=find(MD2==layer2_max)
phiD2(i)=(phi_M2-DENSITY(i+k))/(phi_M2-phi_F);
nphiD2(i)=NPHI(i+k);
VshND2(i)= (NPHI(i+k)-phiD2(i))/(phi_nsh-phi_dsh);
Igr2(i)=(GR(i)-GR_min)/(GR_max-GR_min);
Vsh_stieber2(i)=Igr2(i)/(3-2*Igr2(i));
if VshND2(i)<Vsh_stieber2(i)
Vsh_stieber2(i)=VshND2(i);
else
Vsh_stieber2(i)=Vsh_stieber2(i);
end
phiS2(i)=(DT(i+k)-DT_m)/(DT_f-DT_m);
phiDC2(i)=phiD2(i)-Vsh_stieber2(i)*phi_dsh;
phiNC2(i)=nphiD2(i)-Vsh_stieber2(i)*phi_nsh;
phiE2(i)=(phiNC2(i)+phiDC2(i)+2*phiS2(i))/4;
RS2(i)=RS(i+k);
RT2(i)=RT(i+k);
M=Vsh_stieber2(i)^(1-(Vsh_stieber2(i))/2) / sqrt(Rsh);
D=(phiE2(i)^(m/2)/sqrt(a*Rw) );
C=sqrt(RT2(i));

if M<0
M=0;
elseif D<0
    D=0;
elseif C<0
    C=0;
elseif phiE2(i)<0
    phiE2(i)=0;
end

Sw2(i)=(( C )*( M + D) )^(-1);
%Sw1(i)=( sqrt(RT1(i))*( M + (phiE1(i)^(1.9/2)/sqrt(0.8*0.0395) )) )^(-1);
perm2(i)=sqrt(a/(phiE2(i)^m))*( sqrt(Rmf/RS2(i)) - sqrt(Rw/RT2(i)) );
i=i+1;
end

% plot(VshND2,-MD2);
% xlabel('Calculated Vshale using ND log');
% xlim([0 1]);

% plot(Igr2,-MD2);
% xlabel('I-(GR)');
% xlim([-1 1.5]);

% plot(phiDC2,-MD2);
% xlabel('Shale corrected density porosity');
% xlim([-.5 .5]);

% plot(phiNC2,-MD2);
% xlabel('Shale corrected NPHI porosity');
% xlim([0 1]);

% plot(phiE2,-MD2);
% xlabel('Effective Porosity');
% xlim([0 1]);


% plot(phiS2,-MD2);
% xlabel('Calculated phi-sonic using DT log');
% xlim([0 1]);

% plot(phiD2,-MD2);
% xlabel('Calculated Porosity using density log');
% xlim([-.5 .5]);

% 
% plot(perm2,-MD2);
% xlabel('Sxo-Sw');
% xlim([-1 1]);

% plot(Sw2,-MD2);
% xlabel('Water Saturation');
% xlim([0 1]);


MD3=MD(MD>=layer3_min & MD<=layer3_max);
k=find(MD==layer3_min)-1;
i=1;
while i<=find(MD3==layer3_max)
phiD3(i)=(phi_M1-DENSITY(i+k))/(phi_M1-phi_F);
nphiD3(i)=NPHI(i+k);
VshND3(i)= (NPHI(i+k)-phiD3(i))/(phi_nsh-phi_dsh);
Igr3(i)=(GR(i)-GR_min)/(GR_max-GR_min);
Vsh_stieber3(i)=Igr3(i)/(3-2*Igr3(i));
if VshND3(i)<Vsh_stieber3(i)
Vsh_stieber3(i)=VshND3(i);
else
Vsh_stieber3(i)=Vsh_stieber3(i);
end
phiS3(i)=(DT(i+k)-DT_m)/(DT_f-DT_m);
phiDC3(i)=phiD3(i)-Vsh_stieber3(i)*phi_dsh;
phiNC3(i)=nphiD3(i)-Vsh_stieber3(i)*phi_nsh;
phiE3(i)=(phiNC3(i)+phiDC3(i)+2*phiS3(i))/4;
RS3(i)=RS(i+k);
RT3(i)=RT(i+k);
M=Vsh_stieber3(i)^(1-(Vsh_stieber3(i))/2) / sqrt(Rsh);
D=(phiE3(i)^(m/2)/sqrt(a*Rw) );
C=sqrt(RT3(i));

if M<0
M=0;
elseif D<0
    D=0;
elseif C<0
    C=0;
end

Sw3(i)=(( C )*( M + D) )^(-1);
%Sw1(i)=( sqrt(RT1(i))*( M + (phiE1(i)^(1.9/2)/sqrt(0.8*0.0395) )) )^(-1);
perm3(i)=sqrt(a/(phiE3(i)^m))*( sqrt(Rmf/RS3(i)) - sqrt(Rw/RT3(i)) );
i=i+1;
end

% plot(Vsh_stieber3,-MD3);
% xlabel('Calculated Vshale using ND log');
% xlim([0 1]);

% plot(VshND3,-MD3);
% xlabel('Calculated Vshale using ND log');
% xlim([0 1]);
% 
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
% 
% plot(phiD3,-MD3);
% xlabel('Calculated Porosity using density log');
% xlim([-1 1]);
% % 
% plot(perm3,-MD3);
% xlabel('Sxo-Sw');
% xlim([-1 1]);

% plot(Sw3,-MD3);
% xlabel('Water Saturation');
% xlim([0 1]);

ylabel('Measuring Depth (in m)');
grid on;


% R0=0.3015, m=1.9, a=0.8;
% Rt=R0;
% k=find(MD1==2699.1);
% Rw=(phiE1(k)^m)*R0/a;
