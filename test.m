y=xlsread('1.xlsx','sheet1','L1:L2944');
x=xlsread('1.xlsx','sheet1','M1:M2944');
y1=xlsread('1.xlsx','sheet2','B1:B48');
x1=xlsread('1.xlsx','sheet2','C1:C48');
voronoi(x1,y1);
axis([-180,-60,25,50]);
hold on;
scatter(x,y,'k','.')
