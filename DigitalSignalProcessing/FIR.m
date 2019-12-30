%170603108-杨佳男-实验四
clear
[origrec,SamplingFreq]=audioread('C:\Users\lenovo\Desktop\170603108-杨佳男-实验四\男声.wav');
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
fp1=[50,150];%通带截止频率
fs1=[95,105];%阻带截止频率
wp1=2*fp1/SamplingFreq;%归一化数字频率
ws1=2*fs1/SamplingFreq;%归一化数字频率
transitWidth=ws1(1)-wp1(1);%过渡带宽度
N=ceil(8*pi/transitWidth);%N=A/（Wp-Ws）,对于汉明窗参考课本165页知道A为8pi
%N=301;
N=N+rem(N,2);%取奇数
win=hamming(N+1);
%win=hanning(N+1);
%win=boxcar(N+1);
wc=[(wp1(1)+ws1(1))/2,(wp1(2)+ws1(2))/2,];%阻带参数
b1=fir1(N,wc,'stop',win);
[h1,w1]=freqz(b1);
plot(w1*SamplingFreq/(2*pi),abs(h1))
axis([0 1500 0 10])
grid;
title('滤除100Hz的滤波器'); 
subplot 322
filtered1=filter(b1,1,addNoise);
freq1=fft(filtered1,length(filtered1));
freq1=abs(freq1);
halfFreq1=freq1(1:ceil(length(freq1)/2),:);%因为fft结果是对称的，故只取前一半
f2=0:SamplingFreq/length(freq1):SamplingFreq*(length(halfFreq1)-1)/length(freq1);%横轴分度值为1Hz
plot(f2,halfFreq1)
axis([0 1500 0 2800])
title("滤除100Hz后频率特性")

subplot 323
fp2=[450,550];%通带截止频率
fs2=[495,505];%阻带截止频率
wp2=2*fp2/SamplingFreq;%归一化数字频率
ws2=2*fs2/SamplingFreq;%归一化数字频率
transitWidth2=ws2(1)-wp2(1);%过渡带宽度
N2=ceil(8*pi/transitWidth2);%N=A/（Wp-Ws）,对于汉明窗参考课本165页知道A为8pi
%N=301;
N2=N2+rem(N2,2);%取奇数
win2=hamming(N2+1);
%win2=hanning(N+1);
%win2=boxcar(N+1);

wc2=[(wp2(1)+ws2(1))/2,(wp2(2)+ws2(2))/2,];%阻带参数
b2=fir1(N2,wc2,'stop',win2);
[h2,w2]=freqz(b2);
plot(w2*SamplingFreq/(2*pi),abs(h2))
axis([0 1500 0 10])
grid;
title('滤除500Hz的滤波器'); 
subplot 324
filtered2=filter(b2,1,addNoise);
freq2=fft(filtered2,length(filtered2));
freq2=abs(freq2);
halfFreq2=freq2(1:ceil(length(freq2)/2),:);%因为fft结果是对称的，故只取前一半
f2=0:SamplingFreq/length(freq2):SamplingFreq*(length(halfFreq2)-1)/length(freq2);%横轴分度值为1Hz
plot(f2,halfFreq2)
axis([0 1500 0 2800])
title("滤除500Hz后频率特性")

subplot 325
fp3=[850,950];%通带截止频率
fs3=[895,905];%阻带截止频率
wp3=2*fp3/SamplingFreq;%归一化数字频率
ws3=2*fs3/SamplingFreq;%归一化数字频率
transitWidth3=ws3(1)-wp3(1);%过渡带宽度
N3=ceil(8*pi/transitWidth3);%N=A/（Wp-Ws）,对于汉明窗参考课本165页知道A为8pi
%N=301;
N3=N3+rem(N3,2);%取奇数
win3=hamming(N3+1);
%win3=hanning(N+1);
%win3=boxcar(N+1);

wc3=[(wp3(1)+ws3(1))/2,(wp3(2)+ws3(2))/2,];%阻带参数
b3=fir1(N3,wc3,'stop',win3);
[h3,w3]=freqz(b3);
plot(w3*SamplingFreq/(2*pi),abs(h3))
axis([0 1500 0 10])
grid;
title('滤除900Hz的滤波器'); 
subplot 326
filtered3=filter(b3,1,addNoise);
freq3=fft(filtered3,length(filtered3));
freq3=abs(freq3);
halfFreq3=freq3(1:ceil(length(freq3)/2),:);%因为fft结果是对称的，故只取前一半
f2=0:SamplingFreq/length(freq3):SamplingFreq*(length(halfFreq3)-1)/length(freq3);%横轴分度值为1Hz
plot(f2,halfFreq3)
axis([0 1500 0 2800])
title("滤除900Hz后频率特性")


%%
%三种噪声全滤除
allFiltered=filter(b2,1,filtered1);
allFiltered=filter(b3,1,allFiltered);

figure(4)
subplot 211
plot(t,orig)
title("原时域曲线")
subplot 212
plot(t,allFiltered)
title("滤波后时域曲线")

figure(5)
subplot 211
plot(f,halfFreqorig)
axis([0 1500 0 400])
title("原频率特性")
subplot 212
freqA=fft(allFiltered,length(allFiltered));
freqA=abs(freqA);
halfFreqA=freqA(1:ceil(length(freqA)/2),:);%因为fft结果是对称的，故只取前一半
fA=0:SamplingFreq/length(freqA):SamplingFreq*(length(halfFreqA)-1)/length(freqA);%横轴分度值为1Hz
plot(fA,halfFreqA)
axis([0 1500 0 400])
title("滤波后频率特性")
%%
%误差曲线绘制
figure(6)
subplot 211
plot(t,allFiltered-orig)
tVariance=sqrt(sum((allFiltered-orig).^2)/length(orig))
title("时域误差曲线，均方差为"+num2str(tVariance))

subplot 212
plot(f2,halfFreqA-halfFreqorig)
fVariance=sqrt(sum((halfFreqA-halfFreqorig).^2)/length(halfFreqorig))
axis([0 1500 0 400])
title("频域误差曲线，均方差为"+num2str(fVariance))

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
% sound(allFiltered,SamplingFreq)






