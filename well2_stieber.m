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


%rhoM=2.65, rhoF=1
MD1=MD(MD>=2605 & MD<=2794);
k=find(MD==2605)-1;
i=1;
while i<=find(MD1==2794)
Igr1(i)=(GR(i)-2.720)/(125-2.720);
Vsh1(i)=Igr1(i)/(3-2*Igr1(i));
i=i+1;
end
% plot(Vsh1,-MD1);
% xlabel('V(shale) using Stieber');
% ylabel('Measuring Depth (in m)');
% xlim([0 .5]);
% grid on;

%rhoM=2.16, rhoF=1
MD2=MD(MD>=2795 & MD<=3312);
k=find(MD==2795)-1;
i=1;
while i<=find(MD2==3312)
Igr2(i)=(GR(i)-2.720)/(125-2.720);
Vsh2(i)=Igr2(i)/(3-2*Igr2(i));
i=i+1;
end
% plot(Vsh2,-MD2);
% xlabel('V(shale) using Stieber');
% ylabel('Measuring Depth (in m)');
% xlim([0 .5]);
% grid on;


MD3=MD(MD>=3588 & MD<=3710);
k=find(MD==3588)-1;
i=1;
while i<=find(MD3==3710)
Igr3(i)=(GR(i)-2.720)/(125-2.720);
Vsh3(i)=Igr3(i)/(3-2*Igr3(i));
i=i+1;
end
plot(Vsh3,-MD3);
xlabel('V(shale) using Stieber');
ylabel('Measuring Depth (in m)');
xlim([0 .5]);
grid on;

Vsh1=Vsh1';
Vsh2=Vsh2';
Vsh3=Vsh3';