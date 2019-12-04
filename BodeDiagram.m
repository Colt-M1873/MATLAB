s=tf('s');%tf表示传递函数

G=20*(s+1)/((0.2*s^2+s)*(10*s+1));%建立系统，这是正统的求解系统的方式
%impulse(G);
figure(3)
bode(G)
grid on
figure(4)

f=10/(s*(0.05*s+1));%建立系统，这是正统的求解系统的方式

bode(f)
grid on
figure(5)
m=10/(s*(0.2*s+1));%建立系统，这是正统的求解系统的方式

bode(m)
grid on




