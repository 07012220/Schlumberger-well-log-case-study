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

subplot(1,8,1);
plot(CALI,-MD);
grid on;
xlim([8.45 max(CALI)]);
ylabel('Measuring Depth (in m)');
xlabel('Caliper (in inches)');

subplot(1,8,2);
x1 = DENSITY;
y1 = -MD;
line(x1,y1,'Color','r')
xlim([1.95 2.95]);
ax1 = gca; % current axes
ax1.XColor = 'r';
ax1.YColor = 'r';
ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,'XAxisLocation','top','YAxisLocation','right','Color','none');

x2 = -NPHI;
y2 = -MD;
line(x2,y2,'Parent',ax2,'Color','b')
xlim([-.45 .15]);
legend('Density','NPHI')
grid on;

subplot(1,8,4);
plot(GR,-MD);
xlim([-200 max(GR)]);
ylabel('Measuring Depth (in m)');
xlabel('Gamma Ray (in API)');
grid on;

subplot(1,8,5);
plot(DT,-MD);
xlim([0 max(DT)]);
ylabel('Measuring Depth (in m)');
xlabel('P-TT (in us/ft)');
grid on;

subplot(1,8,6);
semilogx(RS,-MD);
xlim([0.2 2000]);
ylabel('Measuring Depth (in m)');
xlabel('RS (in ohm-m)');
grid on;


subplot(1,8,7);
semilogx(RT,-MD);
xlim([0.2 2000]);
ylabel('Measuring Depth (in m)');
xlabel('RT (in ohm-m)');
grid on;