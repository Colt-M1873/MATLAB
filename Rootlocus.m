syms s;
s=tf('s');%tf表示传递函数
%G=1/(s^2+0.3*s+1);
figure(1);
%subplot(321)
GH=-(s-1)/(s*(s+2))%*(s*s+4*s+20));%GH为开环传递函数
rlocus(GH);
%grid;