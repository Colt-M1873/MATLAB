%170603108-�����-ʵ����
clear
[origrec,SamplingFreq]=audioread('C:\Users\lenovo\Desktop\170603108-�����-ʵ����\����.wav');
orig=origrec(:,1);%ȡ������
%%
%ʱ�����߻���
t=0:1/SamplingFreq:(length(orig)-1)/SamplingFreq;
figure(1)
subplot 211
plot(t,orig)
title("ԭʱ������")
s100=sin(200*pi*t); % ����100Hz���Ҳ�  
s500=sin(1000*pi*t); % ����500Hz���Ҳ�  
s900=sin(1800*pi*t); % ����900Hz���Ҳ�  
noise=(s100+s500+s900)';%����������Ϊ�����飬����s����Ϊ�����飬��Ӧת��
addNoise=orig+noise;
subplot 212
plot(t,addNoise)
title("��������ʱ������")
%%
%Ƶ�����Ի���
figure(2)
subplot 211
freqOrig=fft(orig,length(orig));
freqOrig=abs(freqOrig);
halfFreqorig=freqOrig(1:ceil(length(freqOrig)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f=0:SamplingFreq/length(freqOrig):SamplingFreq*(length(halfFreqorig)-1)/length(freqOrig);%����ֶ�ֵΪ1Hz
plot(f,halfFreqorig)
axis([0 1500 0 400])
title("ԭƵ������")
subplot 212
freqaN=fft(addNoise,length(addNoise));
freqaN=abs(freqaN);
halfFreqaN=freqaN(1:ceil(length(freqaN)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f1=0:SamplingFreq/length(freqaN):SamplingFreq*(length(halfFreqaN)-1)/length(freqaN);%����ֶ�ֵΪ1Hz
plot(f1,halfFreqaN)
axis([0 1500 0 22000])
title("��������Ƶ������")
%%
%��������˲���
figure(3)
subplot 321
fp1=[50,150];%ͨ����ֹƵ��
fs1=[95,105];%�����ֹƵ��
wp1=2*fp1/SamplingFreq;%��һ������Ƶ��
ws1=2*fs1/SamplingFreq;%��һ������Ƶ��
transitWidth=ws1(1)-wp1(1);%���ɴ����
N=ceil(8*pi/transitWidth);%N=A/��Wp-Ws��,���ں������ο��α�165ҳ֪��AΪ8pi
%N=301;
N=N+rem(N,2);%ȡ����
win=hamming(N+1);
%win=hanning(N+1);
%win=boxcar(N+1);
wc=[(wp1(1)+ws1(1))/2,(wp1(2)+ws1(2))/2,];%�������
b1=fir1(N,wc,'stop',win);
[h1,w1]=freqz(b1);
plot(w1*SamplingFreq/(2*pi),abs(h1))
axis([0 1500 0 10])
grid;
title('�˳�100Hz���˲���'); 
subplot 322
filtered1=filter(b1,1,addNoise);
freq1=fft(filtered1,length(filtered1));
freq1=abs(freq1);
halfFreq1=freq1(1:ceil(length(freq1)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f2=0:SamplingFreq/length(freq1):SamplingFreq*(length(halfFreq1)-1)/length(freq1);%����ֶ�ֵΪ1Hz
plot(f2,halfFreq1)
axis([0 1500 0 2800])
title("�˳�100Hz��Ƶ������")

subplot 323
fp2=[450,550];%ͨ����ֹƵ��
fs2=[495,505];%�����ֹƵ��
wp2=2*fp2/SamplingFreq;%��һ������Ƶ��
ws2=2*fs2/SamplingFreq;%��һ������Ƶ��
transitWidth2=ws2(1)-wp2(1);%���ɴ����
N2=ceil(8*pi/transitWidth2);%N=A/��Wp-Ws��,���ں������ο��α�165ҳ֪��AΪ8pi
%N=301;
N2=N2+rem(N2,2);%ȡ����
win2=hamming(N2+1);
%win2=hanning(N+1);
%win2=boxcar(N+1);

wc2=[(wp2(1)+ws2(1))/2,(wp2(2)+ws2(2))/2,];%�������
b2=fir1(N2,wc2,'stop',win2);
[h2,w2]=freqz(b2);
plot(w2*SamplingFreq/(2*pi),abs(h2))
axis([0 1500 0 10])
grid;
title('�˳�500Hz���˲���'); 
subplot 324
filtered2=filter(b2,1,addNoise);
freq2=fft(filtered2,length(filtered2));
freq2=abs(freq2);
halfFreq2=freq2(1:ceil(length(freq2)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f2=0:SamplingFreq/length(freq2):SamplingFreq*(length(halfFreq2)-1)/length(freq2);%����ֶ�ֵΪ1Hz
plot(f2,halfFreq2)
axis([0 1500 0 2800])
title("�˳�500Hz��Ƶ������")

subplot 325
fp3=[850,950];%ͨ����ֹƵ��
fs3=[895,905];%�����ֹƵ��
wp3=2*fp3/SamplingFreq;%��һ������Ƶ��
ws3=2*fs3/SamplingFreq;%��һ������Ƶ��
transitWidth3=ws3(1)-wp3(1);%���ɴ����
N3=ceil(8*pi/transitWidth3);%N=A/��Wp-Ws��,���ں������ο��α�165ҳ֪��AΪ8pi
%N=301;
N3=N3+rem(N3,2);%ȡ����
win3=hamming(N3+1);
%win3=hanning(N+1);
%win3=boxcar(N+1);

wc3=[(wp3(1)+ws3(1))/2,(wp3(2)+ws3(2))/2,];%�������
b3=fir1(N3,wc3,'stop',win3);
[h3,w3]=freqz(b3);
plot(w3*SamplingFreq/(2*pi),abs(h3))
axis([0 1500 0 10])
grid;
title('�˳�900Hz���˲���'); 
subplot 326
filtered3=filter(b3,1,addNoise);
freq3=fft(filtered3,length(filtered3));
freq3=abs(freq3);
halfFreq3=freq3(1:ceil(length(freq3)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f2=0:SamplingFreq/length(freq3):SamplingFreq*(length(halfFreq3)-1)/length(freq3);%����ֶ�ֵΪ1Hz
plot(f2,halfFreq3)
axis([0 1500 0 2800])
title("�˳�900Hz��Ƶ������")


%%
%��������ȫ�˳�
allFiltered=filter(b2,1,filtered1);
allFiltered=filter(b3,1,allFiltered);

figure(4)
subplot 211
plot(t,orig)
title("ԭʱ������")
subplot 212
plot(t,allFiltered)
title("�˲���ʱ������")

figure(5)
subplot 211
plot(f,halfFreqorig)
axis([0 1500 0 400])
title("ԭƵ������")
subplot 212
freqA=fft(allFiltered,length(allFiltered));
freqA=abs(freqA);
halfFreqA=freqA(1:ceil(length(freqA)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
fA=0:SamplingFreq/length(freqA):SamplingFreq*(length(halfFreqA)-1)/length(freqA);%����ֶ�ֵΪ1Hz
plot(fA,halfFreqA)
axis([0 1500 0 400])
title("�˲���Ƶ������")
%%
%������߻���
figure(6)
subplot 211
plot(t,allFiltered-orig)
tVariance=sqrt(sum((allFiltered-orig).^2)/length(orig))
title("ʱ��������ߣ�������Ϊ"+num2str(tVariance))

subplot 212
plot(f2,halfFreqA-halfFreqorig)
fVariance=sqrt(sum((halfFreqA-halfFreqorig).^2)/length(halfFreqorig))
axis([0 1500 0 400])
title("Ƶ��������ߣ�������Ϊ"+num2str(fVariance))

% %%
% %����Ч��
% disp("�����������ԭ����")
% pause
% sound(orig,SamplingFreq)
% disp("���������������������")
% pause
% sound(addNoise,SamplingFreq)
% disp("������������˲�������")
% pause
% sound(allFiltered,SamplingFreq)






