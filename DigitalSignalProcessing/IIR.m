%170603108-�����-ʵ����
clear
[origrec,SamplingFreq]=audioread('C:\Users\lenovo\Desktop\170603108-�����-ʵ����\����.wav',[40000,85000]);
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
fp1=[80,120];%ͨ����ֹƵ��
fs1=[99,101];%�����ֹƵ��
Rp1=1;%ͨ��˥����
Rs1=50;%���˥����
wp1=2*fp1/SamplingFreq%�õ���һ������Ƶ��
ws1=2*fs1/SamplingFreq%�õ���һ������Ƶ��
[N1,Wc1]=buttord(wp1,ws1,Rp1,Rs1);%������˹
[bd1,ad1]=butter(N1,Wc1,'stop');
[N1cheb,Wc1cheb]=cheb1ord(wp1,ws1,Rp1,Rs1);%�б�ѩ��1��
[bd1cheb,ad1cheb]=cheby1(N1,Rp1,Wc1,'stop');
[N1elip,Wc1elip]=ellipord(wp1,ws1,Rp1,Rs1);%��Բ�˲���
[bd1elip,ad1elip]=ellip(N1,Rp1,Rs1,Wc1,'stop');

[h1,w1]=freqz(bd1,ad1);
plot(w1*SamplingFreq/(2*pi),abs(h1))
axis([0 1500 0 10])
grid;
title('�˳�100Hz�İ�����˹�˲���'); 
disp("�˳�100Hz�İ�����˹�˲����Ĵ��ݺ���")
filter1=tf(bd1,ad1)%�˳�100Hz�˲����Ĵ��ݺ���

subplot 323
fp2=[460,540];%ͨ����ֹƵ��
fs2=[497,503];%�����ֹƵ��
Rp2=1;%ͨ��˥����
Rs2=50;%���˥����
wp2=2*fp2/SamplingFreq
ws2=2*fs2/SamplingFreq
[N2,Wc2]=buttord(wp2,ws2,Rp2,Rs2); 
[bd2,ad2]=butter(N2,Wc2,'stop');
[N2cheb,Wc2cheb]=cheb1ord(wp2,ws2,Rp2,Rs2);%�б�ѩ��1��
[bd2cheb,ad2cheb]=cheby1(N2,Rp2,Wc2,'stop');
[N2elip,Wc2elip]=ellipord(wp2,ws2,Rp2,Rs2);%��Բ�˲���
[bd2elip,ad2elip]=ellip(N2,Rp2,Rs2,Wc2,'stop');

[h2,w2]=freqz(bd2,ad2);
plot(w2*SamplingFreq/(2*pi),abs(h2))
axis([0 1500 0 10])
grid;
title('�˳�500Hz�İ�����˹�˲���');
disp("�˳�500Hz������˹�˲����Ĵ��ݺ���")
filter2=tf(bd2,ad2)%�˳�500Hz�˲����Ĵ��ݺ���
 
subplot 325
fp3=[880,920];%ͨ����ֹƵ��
fs3=[898,902];%�����ֹƵ��
Rp3=1;%ͨ��˥����
Rs3=50;%���˥����
wp3=2*fp3/SamplingFreq
ws3=2*fs3/SamplingFreq
[N3,Wc3]=buttord(wp3,ws3,Rp3,Rs3);
[bd3,ad3]=butter(N3,Wc3,'stop');
[N3cheb,Wc3cheb]=cheb1ord(wp3,ws3,Rp3,Rs3);%�б�ѩ��1��
[bd3cheb,ad3cheb]=cheby1(N3,Rp3,Wc3,'stop');
[N3elip,Wc3elip]=ellipord(wp3,ws3,Rp3,Rs3);%�б�ѩ��1��
[bd3elip,ad3elip]=ellip(N3,Rp3,Rs3,Wc3,'stop');

[h3,w3]=freqz(bd3,ad3);
plot(w3*SamplingFreq/(2*pi),abs(h3))
axis([0 1500 0 10])
grid;
title('�˳�900Hz�İ�����˹�˲���');
disp("�˳�900Hz������˹�˲����Ĵ��ݺ���")
filter3=tf(bd3,ad3)%�˳�900Hz�˲����Ĵ��ݺ���

%%
%���������ֱ��˳�
subplot 322
filtered1=filter(bd1,ad1,addNoise);
freq1=fft(filtered1,length(filtered1));
freq1=abs(freq1);
halfFreq1=freq1(1:ceil(length(freq1)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f2=0:SamplingFreq/length(freq1):SamplingFreq*(length(halfFreq1)-1)/length(freq1);%����ֶ�ֵΪ1Hz
plot(f2,halfFreq1)
axis([0 1500 0 2800])
title("������˹�˳�100Hz��Ƶ������")

subplot 324
filtered2=filter(bd2,ad2,addNoise);
freq2=fft(filtered2,length(filtered2));
freq2=abs(freq2);
halfFreq2=freq2(1:ceil(length(freq2)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f2=0:SamplingFreq/length(freq2):SamplingFreq*(length(halfFreq2)-1)/length(freq2);%����ֶ�ֵΪ1Hz
plot(f2,halfFreq2)
axis([0 1500 0 2800])
title("������˹�˳�500Hz��Ƶ������")

subplot 326
filtered3=filter(bd3,ad3,addNoise);
freq3=fft(filtered3,length(filtered3));
freq3=abs(freq3);
halfFreq3=freq3(1:ceil(length(freq3)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f2=0:SamplingFreq/length(freq3):SamplingFreq*(length(halfFreq3)-1)/length(freq3);%����ֶ�ֵΪ1Hz
plot(f2,halfFreq3)
axis([0 1500 0 2800])
title("������˹�˳�900Hz��Ƶ������")
%%
%��������ȫ�˳�
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
title("ԭʱ������")
subplot 222
plot(t,buttFiltered)
title("������˹�˲���ʱ������")
subplot 223
plot(t,chebFiltered)
title("�б�ѩ��1���˲���ʱ������")
subplot 224
plot(t,elipFiltered)
title("��Բ�˲����˲���ʱ������")

figure(5)
subplot 221
plot(f,halfFreqorig)
axis([0 1500 0 400])
title("ԭƵ������")
subplot 222
freqA=fft(buttFiltered,length(buttFiltered));
freqA=abs(freqA);
halfFreqA=freqA(1:ceil(length(freqA)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
fA=0:SamplingFreq/length(freqA):SamplingFreq*(length(halfFreqA)-1)/length(freqA);%����ֶ�ֵΪ1Hz
plot(fA,halfFreqA)
axis([0 1500 0 400])
title("������˹�˲���Ƶ������")
subplot 223
freqCheb=fft(chebFiltered,length(chebFiltered));
freqCheb=abs(freqCheb);
halfFreqCheb=freqCheb(1:ceil(length(freqCheb)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
fA=0:SamplingFreq/length(freqCheb):SamplingFreq*(length(halfFreqCheb)-1)/length(freqCheb);%����ֶ�ֵΪ1Hz
plot(fA,halfFreqCheb)
axis([0 1500 0 400])
title("�б�ѩ���˲���Ƶ������")
subplot 224
freqElip=fft(elipFiltered,length(elipFiltered));
freqElip=abs(freqElip);
halfFreqElip=freqElip(1:ceil(length(freqElip)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
fA=0:SamplingFreq/length(freqElip):SamplingFreq*(length(halfFreqElip)-1)/length(freqElip);%����ֶ�ֵΪ1Hz
plot(fA,halfFreqElip)
axis([0 1500 0 400])
title("��Բ�˲���Ƶ������")































%%
%ʱ��������߻���
figure(6)
subplot 311
plot(t,buttFiltered-orig)
tVariance1=sqrt(sum((buttFiltered-orig).^2)/length(orig))
title("������˹�˲���ʱ��������ߣ�������Ϊ"+num2str(tVariance1))
subplot 312
plot(t,chebFiltered-orig)
tVariance2=sqrt(sum((chebFiltered-orig).^2)/length(orig))
title("�б�ѩ��1���˲���ʱ��������ߣ�������Ϊ"+num2str(tVariance2))
subplot 313
plot(t,elipFiltered-orig)
tVariance3=sqrt(sum((elipFiltered-orig).^2)/length(orig))
title("��Բ�˲���ʱ��������ߣ�������Ϊ"+num2str(tVariance3))

%Ƶ��������߻���
figure(7)
subplot 311
plot(f2,halfFreqA-halfFreqorig)
fVariance1=sqrt(sum((halfFreqA-halfFreqorig).^2)/length(halfFreqorig))
axis([0 1500 0 400])
title("������˹�˲���Ƶ��������ߣ�������Ϊ"+num2str(fVariance1))
subplot 312
plot(f2,halfFreqCheb-halfFreqorig)
fVariance2=sqrt(sum((halfFreqCheb-halfFreqorig).^2)/length(halfFreqorig))
axis([0 1500 0 400])
title("�б�ѩ��1���˲���Ƶ��������ߣ�������Ϊ"+num2str(fVariance2))
subplot 313
plot(f2,halfFreqElip-halfFreqorig)
fVariance3=sqrt(sum((halfFreqElip-halfFreqorig).^2)/length(halfFreqorig))
axis([0 1500 0 400])
title("��Բ�˲���Ƶ��������ߣ�������Ϊ"+num2str(fVariance3))

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
% sound(buttFiltered,SamplingFreq)



