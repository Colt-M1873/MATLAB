clear
syms s;
s=tf('s');%tf��ʾ���ݺ���
G1=40*(0.092*s+1)/(s*(0.2*s+1)*(0.03*s+1));%����ϵͳ��������ͳ�����ϵͳ�ķ�ʽ
%G1=40/(s*(0.05*s+1)*(0.1*s+1));%����ϵͳ��������ͳ�����ϵͳ�ķ�ʽ
%G1=40/(s*(0.2*s+1));%����ϵͳ��������ͳ�����ϵͳ�ķ�ʽ

G=-1/(1+G1)

figure(1)
impulse(G);
grid;
title("impulse")

figure(2);
step(G);%G�ĵ�λ��Ծ��Ӧ
stepinfo(G)
grid;

% figure(3)
% step(G/s);%G��б����Ӧ��matlab��û��б����Ӧ���������ͨ��������Ľ�Ծ���֣�������s�õ�
% title("slope")
 % grid;

% figure(4)
% nyquist(G1)
% figure(5)
% bode(G1)