syms s;
s=tf('s');%tf��ʾ���ݺ���
%G=1/(s^2+0.3*s+1);
figure(1);
%subplot(321)
GH=-(s-1)/(s*(s+2))%*(s*s+4*s+20));%GHΪ�������ݺ���
rlocus(GH);
%grid;