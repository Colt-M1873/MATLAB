%G(s)=num/den
%������ϵͳ��Ӧ�ķ�ʽ
figure(1);
subplot(211);
syms s;
t=[0:0.1:40];
num=[1]; 
den=[1,0.3,1];
impulse(num,den,t);%�͵�������ϵͳG(s)=1/(s^2+0.3s+1)�����ַ�ʽ�����ڱȽϼ򵥵�ϵͳ
grid;
title('Unit-impulse Response of G(s)=1/(s^2+0.3s+1)') 

subplot(212);
s=tf('s');%tf��ʾ���ݺ���
G=1/(s^2+0.3*s+1);%����ϵͳ��������ͳ�����ϵͳ�ķ�ʽ
impulse(G);
grid;

figure(2);
subplot(211);
G=1/(s^2+0.3*s+1);%����ϵͳ
step(G);%G�ĵ�λ��Ծ��Ӧ
grid;
subplot(212);
G=1/(s^2+0.3*s+1);%����ϵͳ
step(G/s);%G��б����Ӧ��matlab��û��б����Ӧ���������ͨ��������Ľ�Ծ���֣�������s�õ�
grid;





