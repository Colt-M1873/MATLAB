clear
clc
num=[1];
den=[60 1];
G=tf(num,den,'ioDelay',80)%ԭϵͳ�Ĵ��ݺ���
ts=0.001;  %����ʱ��=0.001s
DiscreteG=c2d(G,ts,'z');      %��ɢ��
[Dnum,Dden]=tfdata(DiscreteG,'v');   %��ȡ��ɢ���ݺ���
for kd=0:5:25
    kp=1;
    ki=0.001;
    elast=0;    
    Ee=0;     
    ulast=0.0;   
    ylast=0;     
    u=zeros(1,600000);%ÿһǧ����Ϊһ��
    time=zeros(1,600000);%�ܵ�ʱ�̵�
    for k=1:1:100000
        time(k)=k*ts;   
        r(k)=0;      %����
        y(k)=-1*Dden(2)*ylast+Dnum(2)*ulast+Dnum(1)*u(k);%ϵͳ��Ӧ�������
        e(k)=r(k)-y(k);   %���
        u(k)=kp*e(k)+ki*Ee+kd*(e(k)-elast); %ϵͳPID�������������
        Ee=Ee+e(k);    
        ulast=u(k);    
        ylast=y(k);   
        elast=e(k);		
    end
    for k=100000:1:600000
        time(k)=k*ts;  
        r(k)=1;      %����
        y(k)=-1*Dden(2)*ylast+Dnum(2)*ulast+Dnum(1)*u(k);%ϵͳ��Ӧ�������
        e(k)=r(k)-y(k);   %���
        u(k)=kp*e(k)+ki*Ee+kd*(e(k)-elast); %ϵͳPID�������������
        Ee=Ee+e(k);    %�����ۼӺ�
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
pin=plot(time,r,'-k');xlim([0,600]);hold on;%�����ź�����
title('kp=1, ki=0.001, 0��kd��25000')
