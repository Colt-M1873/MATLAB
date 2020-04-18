clear
clc
num=[1];
den=[60 1];
G=tf(num,den,'ioDelay',80)%原系统的传递函数
ts=0.001;  %采样时间=0.001s
DiscreteG=c2d(G,ts,'z');      %离散化
[Dnum,Dden]=tfdata(DiscreteG,'v');   %获取离散传递函数
for kd=0:5:25
    kp=1;
    ki=0.001;
    elast=0;    
    Ee=0;     
    ulast=0.0;   
    ylast=0;     
    u=zeros(1,600000);%每一千个点为一秒
    time=zeros(1,600000);%总的时刻点
    for k=1:1:100000
        time(k)=k*ts;   
        r(k)=0;      %输入
        y(k)=-1*Dden(2)*ylast+Dnum(2)*ulast+Dnum(1)*u(k);%系统响应输出序列
        e(k)=r(k)-y(k);   %误差
        u(k)=kp*e(k)+ki*Ee+kd*(e(k)-elast); %系统PID控制器输出序列
        Ee=Ee+e(k);    
        ulast=u(k);    
        ylast=y(k);   
        elast=e(k);		
    end
    for k=100000:1:600000
        time(k)=k*ts;  
        r(k)=1;      %输入
        y(k)=-1*Dden(2)*ylast+Dnum(2)*ulast+Dnum(1)*u(k);%系统响应输出序列
        e(k)=r(k)-y(k);   %误差
        u(k)=kp*e(k)+ki*Ee+kd*(e(k)-elast); %系统PID控制器输出序列
        Ee=Ee+e(k);    %误差的累加和
        ulast=u(k);   
        ylast=y(k);   
        elast=e(k);		
    end
    if kd==0
        pout1=plot(time,y,'-b');xlim([0,600]);;hold on;
    else if kd==25
            pout2=plot(time,y,'-r');xlim([0,600]);hold on;
        else
            pout=plot(time,y,'-y');xlim([0,600]);hold on;;
        end
    end
end
pin=plot(time,r,'-k');xlim([0,600]);hold on;%输入信号曲线
title('kp=1, ki=0.001, 0≤kd≤25000')
