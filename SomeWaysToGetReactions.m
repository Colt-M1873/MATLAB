%G(s)=num/den
%两种求系统响应的方式
figure(1);
subplot(211);
syms s;
t=[0:0.1:40];
num=[1]; 
den=[1,0.3,1];
impulse(num,den,t);%就等于输入系统G(s)=1/(s^2+0.3s+1)，这种方式适用于比较简单的系统
grid;
title('Unit-impulse Response of G(s)=1/(s^2+0.3s+1)') 

subplot(212);
s=tf('s');%tf表示传递函数
G=1/(s^2+0.3*s+1);%建立系统，这是正统的求解系统的方式
impulse(G);
grid;

figure(2);
subplot(211);
G=1/(s^2+0.3*s+1);%建立系统
step(G);%G的单位阶跃相应
grid;
subplot(212);
G=1/(s^2+0.3*s+1);%建立系统
step(G/s);%G的斜坡相应，matlab里没有斜坡相应函数，因此通过将输入的阶跃积分，即除以s得到
grid;





