clc,clear,close all
load task2b-30.mat;
imshow('seoul.png', 'XData', [126.754690*111, 127.191396*111], 'YData', [37.700715*111,37.426394*111]);
hold on;
i=1;
scatter(X_cars,Y_cars,'k','.');
car_num=xlsread('1.xlsx','sheet3','J6:J6');
while(i<=n)
    new_car_num=ceil(car_num(i,1)/2/100/10*5/24);
    car_num(i,1)=car_num(i,1)+new_car_num;
    j=1;
    X_state_cars=zeros(1,1);
    Y_state_cars=zeros(1,1);
    while(j<=new_car_num)
        X_cars(num,1)=rand*(x2(i,1)-x1(i,1))+x1(i,1);
        Y_cars(num,1)=rand*(y1(i,1)-y2(i,1))+y2(i,1);
        X_state_cars(j,1)=X_cars(num,1);
        Y_state_cars(j,1)=Y_cars(num,1);
        num=num+1;
        j=j+1;
    end
    scatter(X_state_cars,Y_state_cars,'b','.');
    num=num-1;
    j=j-1;
    a=ceil(j/(3*(2+0.18)));
    if(a<0)
        a=0;
    end
    scatter( X_stop_sit(i,:),Y_stop_sit(i,:),'g');
    
    X_tmp=zeros(1,1);
    Y_tmp=zeros(1,1);
    gg=1;
    Min=inf;
    min=1;
    while(gg<=40000)
        k=1;
        while(k<=a)
            X_tmp(gg,k)=rand*(x2(i,1)-x1(i,1))+x1(i,1);
            Y_tmp(gg,k)=rand*(y1(i,1)-y2(i,1))+y2(i,1);
            ii=1;
            while(ii<k)
                if(X_tmp(gg,k)==X_tmp(gg,ii)&&Y_tmp(gg,k)==Y_tmp(gg,ii))
                    k=k-1;
                    break;
                end
                ii=ii+1;
            end          
            k=k+1;
        end
        k=1;
        flag=1;
        while(k<=a)
            kk=1;
            while(kk<=state_stop_num)
                if(X_tmp(gg,k)==X_stop_sit(1,kk)&&Y_tmp(gg,k)==Y_stop_sit(1,kk))
                    flag=0;
                    break;
                end
                kk=kk+1;
            end
            if(flag==0)
                gg=gg-1;
                break;
            end
            k=k+1;
        end
        if(flag==1)
            k=1;
            sum=0;
            while(k<=a)
                 ii=1;
                 p1=[X_tmp(gg,k) Y_tmp(gg,k)];
            
                 while(ii<=j)
                    p2=[X_state_cars(ii,1) Y_state_cars(ii,1) ];
                    sum=sum+norm(p1-p2);
                    ii=ii+1;
                 end      
                 k=k+1;
            end
            if(sum<=Min)
                Min=sum;
                min=gg;
            end
        end
        gg=gg+1;
    end
    j=1;
    while(j<=a)
        X_stop_sit(i,j+state_stop_num(1,i))=X_tmp(min,j);
        Y_stop_sit(i,j+state_stop_num(1,i))=Y_tmp(min,j);
        j=j+1;
    end
    state_stop_num(1,i)=state_stop_num(1,i)+a;
    scatter( X_tmp(min,:),Y_tmp(min,:),'c');
    i=i+1;
end
set(gca,'YDir','normal')
save('task2b-50.mat');