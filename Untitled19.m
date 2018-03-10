clc,clear,close all
y2=xlsread('1.xlsx','sheet4','D2:D12');
x2=xlsread('1.xlsx','sheet4','C2:C12');
plot(x2,y2)