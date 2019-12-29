%170603108-杨佳男-实验三
clear
[origrec,SamplingFreq]=audioread('C:\Users\lenovo\Desktop\170603108-杨佳男-实验三\男声.wav',[40000,85000]);
orig=origrec(:,1);%取左声道
%%
%时域曲线绘制
t=0:1/SamplingFreq:(length(orig)-1)/SamplingFreq;
figure(1)
subplot 211
plot(t,orig)
title("原时域曲线")
s100=sin(200*pi*t); % 产生100Hz正弦波  
s500=sin(1000*pi*t); % 产生500Hz正弦波  
s900=sin(1800*pi*t); % 产生900Hz正弦波  
noise=(s100+s500+s900)';%因单声道声音为列数组，几个s噪音为行数组，故应转置
addNoise=orig+noise;
subplot 212
plot(t,addNoise)
title("加噪声后时域曲线")
%%
%频率特性绘制
figure(2)
subplot 211
freqOrig=fft(orig,length(orig));
freqOrig=abs(freqOrig);
halfFreqorig=freqOrig(1:ceil(length(freqOrig)/2),:);%因为fft结果是对称的，故只取前一半
f=0:SamplingFreq/length(freqOrig):SamplingFreq*(length(halfFreqorig)-1)/length(freqOrig);%横轴分度值为1Hz
plot(f,halfFreqorig)
axis([0 1500 0 400])
title("原频率特性")
subplot 212
freqaN=fft(addNoise,length(addNoise));
freqaN=abs(freqaN);
halfFreqaN=freqaN(1:ceil(length(freqaN)/2),:);%因为fft结果是对称的，故只取前一半
f1=0:SamplingFreq/length(freqaN):SamplingFreq*(length(halfFreqaN)-1)/length(freqaN);%横轴分度值为1Hz
plot(f1,halfFreqaN)
axis([0 1500 0 22000])
title("加噪声后频率特性")
%%
%设计三个滤波器

figure(3)
subplot 321
fp1=[80,120];%通带截止频率
fs1=[99,101];%阻带截止频率
Rp1=1;%通带衰减率
Rs1=50;%阻带衰减率
wp1=2*fp1/SamplingFreq%得到归一化数字频率
ws1=2*fs1/SamplingFreq%得到归一化数字频率
[N1,Wc1]=buttord(wp1,ws1,Rp1,Rs1);%巴特沃斯
[bd1,ad1]=butter(N1,Wc1,'stop');
[N1cheb,Wc1cheb]=cheb1ord(wp1,ws1,Rp1,Rs1);%切比雪夫1型
[bd1cheb,ad1cheb]=cheby1(N1,Rp1,Wc1,'stop');
[N1elip,Wc1elip]=ellipord(wp1,ws1,Rp1,Rs1);%椭圆滤波器
[bd1elip,ad1elip]=ellip(N1,Rp1,Rs1,Wc1,'stop');

[h1,w1]=freqz(bd1,ad1);
plot(w1*SamplingFreq/(2*pi),abs(h1))
axis([0 1500 0 10])
grid;
title('滤除100Hz的巴特沃斯滤波器'); 
disp("滤除100Hz的巴特沃斯滤波器的传递函数")
filter1=tf(bd1,ad1)%滤除100Hz滤波器的传递函数

subplot 323
fp2=[460,540];%通带截止频率
fs2=[497,503];%阻带截止频率
Rp2=1;%通带衰减率
Rs2=50;%阻带衰减率
wp2=2*fp2/SamplingFreq
ws2=2*fs2/SamplingFreq
[N2,Wc2]=buttord(wp2,ws2,Rp2,Rs2); 
[bd2,ad2]=butter(N2,Wc2,'stop');
[N2cheb,Wc2cheb]=cheb1ord(wp2,ws2,Rp2,Rs2);%切比雪夫1型
[bd2cheb,ad2cheb]=cheby1(N2,Rp2,Wc2,'stop');
[N2elip,Wc2elip]=ellipord(wp2,ws2,Rp2,Rs2);%椭圆滤波器
[bd2elip,ad2elip]=ellip(N2,Rp2,Rs2,Wc2,'stop');

[h2,w2]=freqz(bd2,ad2);
plot(w2*SamplingFreq/(2*pi),abs(h2))
axis([0 1500 0 10])
grid;
title('滤除500Hz的巴特沃斯滤波器');
disp("滤除500Hz巴特沃斯滤波器的传递函数")
filter2=tf(bd2,ad2)%滤除500Hz滤波器的传递函数
 
subplot 325
fp3=[880,920];%通带截止频率
fs3=[898,902];%阻带截止频率
Rp3=1;%通带衰减率
Rs3=50;%阻带衰减率
wp3=2*fp3/SamplingFreq
ws3=2*fs3/SamplingFreq
[N3,Wc3]=buttord(wp3,ws3,Rp3,Rs3);
[bd3,ad3]=butter(N3,Wc3,'stop');
[N3cheb,Wc3cheb]=cheb1ord(wp3,ws3,Rp3,Rs3);%切比雪夫1型
[bd3cheb,ad3cheb]=cheby1(N3,Rp3,Wc3,'stop');
[N3elip,Wc3elip]=ellipord(wp3,ws3,Rp3,Rs3);%切比雪夫1型
[bd3elip,ad3elip]=ellip(N3,Rp3,Rs3,Wc3,'stop');

[h3,w3]=freqz(bd3,ad3);
plot(w3*SamplingFreq/(2*pi),abs(h3))
axis([0 1500 0 10])
grid;
title('滤除900Hz的巴特沃斯滤波器');
disp("滤除900Hz巴特沃斯滤波器的传递函数")
filter3=tf(bd3,ad3)%滤除900Hz滤波器的传递函数

%%
%三种噪声分别滤除
subplot 322
filtered1=filter(bd1,ad1,addNoise);
freq1=fft(filtered1,length(filtered1));
freq1=abs(freq1);
halfFreq1=freq1(1:ceil(length(freq1)/2),:);%因为fft结果是对称的，故只取前一半
f2=0:SamplingFreq/length(freq1):SamplingFreq*(length(halfFreq1)-1)/length(freq1);%横轴分度值为1Hz
plot(f2,halfFreq1)
axis([0 1500 0 2800])
title("巴特沃斯滤除100Hz后频率特性")

subplot 324
filtered2=filter(bd2,ad2,addNoise);
freq2=fft(filtered2,length(filtered2));
freq2=abs(freq2);
halfFreq2=freq2(1:ceil(length(freq2)/2),:);%因为fft结果是对称的，故只取前一半
f2=0:SamplingFreq/length(freq2):SamplingFreq*(length(halfFreq2)-1)/length(freq2);%横轴分度值为1Hz
plot(f2,halfFreq2)
axis([0 1500 0 2800])
title("巴特沃斯滤除500Hz后频率特性")

subplot 326
filtered3=filter(bd3,ad3,addNoise);
freq3=fft(filtered3,length(filtered3));
freq3=abs(freq3);
halfFreq3=freq3(1:ceil(length(freq3)/2),:);%因为fft结果是对称的，故只取前一半
f2=0:SamplingFreq/length(freq3):SamplingFreq*(length(halfFreq3)-1)/length(freq3);%横轴分度值为1Hz
plot(f2,halfFreq3)
axis([0 1500 0 2800])
title("巴特沃斯滤除900Hz后频率特性")
%%
%三种噪声全滤除
buttFiltered=filter(bd2,ad2,filtered1);
buttFiltered=filter(bd3,ad3,buttFiltered);

filtered1cheb=filter(bd1cheb,ad1cheb,addNoise);
chebFiltered=filter(bd2cheb,ad2cheb,filtered1cheb);
chebFiltered=filter(bd3cheb,ad3cheb,chebFiltered);

filtered1elip=filter(bd1elip,ad1elip,addNoise);
elipFiltered=filter(bd2elip,ad2elip,filtered1elip);
elipFiltered=filter(bd3elip,ad3elip,elipFiltered);

figure(4)
subplot 221
plot(t,orig)
title("原时域曲线")
subplot 222
plot(t,buttFiltered)
title("巴特沃斯滤波后时域曲线")
subplot 223
plot(t,chebFiltered)
title("切比雪夫1型滤波后时域曲线")
subplot 224
plot(t,elipFiltered)
title("椭圆滤波器滤波后时域曲线")

figure(5)
subplot 221
plot(f,halfFreqorig)
axis([0 1500 0 400])
title("原频率特性")
subplot 222
freqA=fft(buttFiltered,length(buttFiltered));
freqA=abs(freqA);
halfFreqA=freqA(1:ceil(length(freqA)/2),:);%因为fft结果是对称的，故只取前一半
fA=0:SamplingFreq/length(freqA):SamplingFreq*(length(halfFreqA)-1)/length(freqA);%横轴分度值为1Hz
plot(fA,halfFreqA)
axis([0 1500 0 400])
title("巴特沃斯滤波后频率特性")
subplot 223
freqCheb=fft(chebFiltered,length(chebFiltered));
freqCheb=abs(freqCheb);
halfFreqCheb=freqCheb(1:ceil(length(freqCheb)/2),:);%因为fft结果是对称的，故只取前一半
fA=0:SamplingFreq/length(freqCheb):SamplingFreq*(length(halfFreqCheb)-1)/length(freqCheb);%横轴分度值为1Hz
plot(fA,halfFreqCheb)
axis([0 1500 0 400])
title("切比雪夫滤波后频率特性")
subplot 224
freqElip=fft(elipFiltered,length(elipFiltered));
freqElip=abs(freqElip);
halfFreqElip=freqElip(1:ceil(length(freqElip)/2),:);%因为fft结果是对称的，故只取前一半
fA=0:SamplingFreq/length(freqElip):SamplingFreq*(length(halfFreqElip)-1)/length(freqElip);%横轴分度值为1Hz
plot(fA,halfFreqElip)
axis([0 1500 0 400])
title("椭圆滤波后频率特性")































%%
%时域误差曲线绘制
figure(6)
subplot 311
plot(t,buttFiltered-orig)
tVariance1=sqrt(sum((buttFiltered-orig).^2)/length(orig))
title("巴特沃斯滤波器时域误差曲线，均方差为"+num2str(tVariance1))
subplot 312
plot(t,chebFiltered-orig)
tVariance2=sqrt(sum((chebFiltered-orig).^2)/length(orig))
title("切比雪夫1型滤波器时域误差曲线，均方差为"+num2str(tVariance2))
subplot 313
plot(t,elipFiltered-orig)
tVariance3=sqrt(sum((elipFiltered-orig).^2)/length(orig))
title("椭圆滤波器时域误差曲线，均方差为"+num2str(tVariance3))

%频域误差曲线绘制
figure(7)
subplot 311
plot(f2,halfFreqA-halfFreqorig)
fVariance1=sqrt(sum((halfFreqA-halfFreqorig).^2)/length(halfFreqorig))
axis([0 1500 0 400])
title("巴特沃斯滤波器频域误差曲线，均方差为"+num2str(fVariance1))
subplot 312
plot(f2,halfFreqCheb-halfFreqorig)
fVariance2=sqrt(sum((halfFreqCheb-halfFreqorig).^2)/length(halfFreqorig))
axis([0 1500 0 400])
title("切比雪夫1型滤波器频域误差曲线，均方差为"+num2str(fVariance2))
subplot 313
plot(f2,halfFreqElip-halfFreqorig)
fVariance3=sqrt(sum((halfFreqElip-halfFreqorig).^2)/length(halfFreqorig))
axis([0 1500 0 400])
title("椭圆滤波器频域误差曲线，均方差为"+num2str(fVariance3))

% %%
% %播放效果
% disp("按任意键播放原声音")
% pause
% sound(orig,SamplingFreq)
% disp("按任意键播加噪声后声音")
% pause
% sound(addNoise,SamplingFreq)
% disp("按任意键播放滤波后声音")
% pause
% sound(buttFiltered,SamplingFreq)



