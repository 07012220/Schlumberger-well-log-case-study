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

% figure
% x1 = DENSITY;
% y1 = -MD;
% line(x1,y1,'Color','r')
% xlim([1.95 2.95]);
% ax1 = gca; % current axes
% ax1.XColor = 'r';
% ax1.YColor = 'r';
% ax1_pos = ax1.Position; % position of first axes
% ax2 = axes('Position',ax1_pos,'XAxisLocation','top','YAxisLocation','right','Color','none');
% 
% x2 = -NPHI;
% y2 = -MD;
% line(x2,y2,'Parent',ax2,'Color','b')
% xlim([-.45 .15]);

plot(DENSITY,-MD);
xlim([0 4]);
grid on;