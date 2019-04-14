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
i=1
while i<11762
Vshale(i)=(GR(i)-min(GR))/(95-.8520);
i=i+1;
end

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
xlim([-200 200]);
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
plot(DTS,-MD);
xlim([0 max(DTS)]);
ylabel('Measuring Depth (in m)');
xlabel('S-TT (in us/ft)');
grid on;

subplot(1,8,7);
semilogx(RS,-MD);
xlim([-20 max(RS)]);
ylabel('Measuring Depth (in m)');
xlabel('RS (in ohm-m)');
grid on;


subplot(1,8,8);
semilogx(RT,-MD);
xlim([-20 180]);
ylabel('Measuring Depth (in m)');
xlabel('RT (in ohm-m)');
grid on;