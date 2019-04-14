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

subplot(1,8,1);
plot(CALI,-MD);
grid on;
xlim([8.45 max(CALI)]);
ylabel('Measuring Depth (in m)');
xlabel('Caliper (in inches)');

subplot(1,8,2);
plot(DENSITY,-MD,'r',NPHI+1.95,-MD,'b');
grid on;
xlim([-max(DENSITY) max(DENSITY)+2]);
ylabel('Measuring Depth (in m)');
xlabel('Density (in g/cc)');


subplot(1,8,3);
plot(GR,-MD);
xlim([-200 max(GR)]);
ylabel('Measuring Depth (in m)');
xlabel('Gamma Ray (in API)');
grid on;

subplot(1,8,4);
plot(NPHI,-MD);
xlim([-.25 1]);
ylabel('Measuring Depth (in m)');
xlabel('Neutron Porosity');
grid on;

subplot(1,8,5);
plot(DT,-MD);
xlim([0 max(DT)]);
ylabel('Measuring Depth (in m)');
xlabel('P-TT (in us/ft)');
grid on;

subplot(1,8,6);
plot(DTS,-MD);
xlim([0 max(DTS)]);
ylabel('Measuring Depth (in m)');
xlabel('S-TT (in us/ft)');
grid on;

subplot(1,8,7);
plot(RS,-MD);
xlim([-20 max(RS)]);
ylabel('Measuring Depth (in m)');
xlabel('RS (in ohm-m)');
grid on;


subplot(1,8,8);
plot(RT,-MD);
xlim([-20 max(RT)]);
ylabel('Measuring Depth (in m)');
xlabel('RT (in ohm-m)');
grid on;