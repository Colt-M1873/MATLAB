syms s;
s=tf('s');%tf表示传递函数
%G=1/(s^2+0.3*s+1);
GH=(s*s+2*s+4)/(s*(s+4)*(s+6)*(s*s+1.4*s+1));%GH为开环传递函数
rlocus(GH);
grid;




