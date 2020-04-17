% s=tf('s');%tf表示传递函数
% G=1/(60*s+1);%建立系统，这是正统的求解系统的方式
num=[1];
den=[60 1];
G=tf(num,den,'ioDelay',80)%得到原系统的传递函数
ts=0.005;  %采样时间=0.005s
DiscreteG=c2d(G,ts,'z');      %离散化
[Dnum,Dden]=tfdata(DiscreteG,'v');   %
e_1=0;      %前一时刻的偏差      
Ee=0;       %累积偏差
u_1=0.0;    %前一时刻的控制量
y_1=0;       %前一时刻的输出
%PID参数
kp=1;    
ki=0.005;
kd=25;
u=zeros(1,10000);%预先分配内存
time=zeros(1,10000);%时刻点（设定1000个）
for k=1:1:10000
    time(k)=k*ts;   %时间参数
    r(k)=0.1;      %期望值
    y(k)=-1*Dden(2)*y_1+Dnum(2)*u_1+Dnum(1)*u(k);%系统响应输出序列
    e(k)=r(k)-y(k);   %误差信号
    u(k)=kp*e(k)+ki*Ee+kd*(e(k)-e_1); %系统PID控制器输出序列
    Ee=Ee+e(k);    %误差的累加和
    u_1=u(k);    	%前一个的控制器输出值
    y_1=y(k);    	%前一个的系统响应输出值
    e_1=e(k);		%前一个误差信号的值
end
%（仅绘制过渡过程的曲线，x坐标限制为[0,1]）
p1=plot(time,r,'-.');xlim([0,100]);hold on;%指令信号的曲线（即期望输入）
p2=plot(time,y,'--');xlim([0,100]);%不含积分分离的PID曲线
hold on;
