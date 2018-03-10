clc,clear,close all
y1=xlsread('1.xlsx','sheet4','B2:B12');
x1=xlsread('1.xlsx','sheet4','A2:A12');
a1=polyfit(x1,y1,1);
x=2018:2094;
n=size(x);
n=n(2);
y=a1(2)+a1(1)*x;
i=2;
yy=zeros(1,n);
yy(1,1)=288;
while(i<=n)
    yy(1,i)=yy(1,i-1)*(1+y(1,i)/100*4);
    i=i+1;
end
plot(x,yy)
hold on;
y2=xlsread('1.xlsx','sheet4','D2:D12');
x2=xlsread('1.xlsx','sheet4','C2:C12');
a1=polyfit(x2,y2,1);
x3=2018:2094;
n=size(x3);
n=n(2);
y3=a1(2)+a1(1)*x3;
plot(x3,y3)
i=2;
while(i<=n)
    if(y3(1,i)/yy(1,i)<=10+0.5&&y3(1,i)/yy(1,i)>=10-0.5)
        x(1,i)
        scatter(x(1,i),0,'r');
        hold on;
    end
    if(y3(1,i)/yy(1,i)<=3+0.1&&y3(1,i)/yy(1,i)>=3-0.1)
        x(1,i)
        scatter(x(1,i),0,'r');
        hold on;
    end
    if(y3(1,i)/yy(1,i)<=2+0.1&&y3(1,i)/yy(1,i)>=2-0.1)
        x(1,i)
        scatter(x(1,i),0,'r');
        hold on;
    end
    if(y3(1,i)/yy(1,i)<=1+0.05&&y3(1,i)/yy(1,i)>=1-0.05)
        x(1,i)
        scatter(x(1,i),0,'r');
        hold on;
    end
    i=i+1;
end