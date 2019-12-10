clear
syms s;
s=tf('s');%tf表示传递函数
G1=40*(0.092*s+1)/(s*(0.2*s+1)*(0.03*s+1));%建立系统，这是正统的求解系统的方式
%G1=40/(s*(0.05*s+1)*(0.1*s+1));%建立系统，这是正统的求解系统的方式
%G1=40/(s*(0.2*s+1));%建立系统，这是正统的求解系统的方式

G=-1/(1+G1)

figure(1)
impulse(G);
grid;
title("impulse")

figure(2);
step(G);%G的单位阶跃相应
stepinfo(G)
grid;

% figure(3)
% step(G/s);%G的斜坡相应，matlab里没有斜坡相应函数，因此通过将输入的阶跃积分，即除以s得到
% title("slope")
 % grid;

% figure(4)
% nyquist(G1)
% figure(5)
% bode(G1)