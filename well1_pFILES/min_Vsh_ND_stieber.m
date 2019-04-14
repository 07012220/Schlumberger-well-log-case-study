clc
close all
clear all
M=importdata('Vsh(stieber).txt');
N=importdata('VshND.txt');

for i=1:5953
if M(i)<N(i)
min_Vsh_NDstieber(i)=M(i);
else
min_Vsh_NDstieber(i)=N(i);
end
end