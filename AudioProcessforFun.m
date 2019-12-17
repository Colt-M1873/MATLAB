clear
[wang1,SamplingFreq1]=audioread('C:\Users\lenovo\Desktop\王总语录 - 副本\录音 (5).wav',[36500,53000]);
[wang2,SamplingFreq2]=audioread('C:\Users\lenovo\Desktop\王总语录 - 副本\野兽.wav',[120000,155000]);
[wang3,SamplingFreq3]=audioread('C:\Users\lenovo\Desktop\王总语录 - 副本\录音 (5).wav',[40000,48000]);
%此处wang为一个n行2列的声音矩阵，记录着每次采样时的左右声道声音强度，n为总采样次数，第一列为左声道，第二列右声道，SamplingFreq为采样率

figure('name','时域')
title("时域")
subplot 211
left1=wang1(:,1);
t1=0:1/SamplingFreq1:(length(left1)-1)/SamplingFreq1;
plot(t1,left1)
title("尖叫")

subplot 212
left2=wang2(:,1);
t2=0:1/SamplingFreq2:(length(left2)-1)/SamplingFreq2;
plot(t2,left2)
title("嚎叫")

figure('name','频域')
subplot 211
freq1=fft(left1,length(left1));
freq1=abs(freq1);
Halffreq1=freq1(1:ceil(length(freq1)/2),:)
f1=0:SamplingFreq1/length(freq1):SamplingFreq1*(length(Halffreq1)-1)/length(freq1)
%freq1=fftshift(freq1)
plot(f1,Halffreq1)
axis([0 8000 0 400])
title("尖叫")

subplot 212
freq2=fft(left2,length(left2));
freq2=abs(freq2);
Halffreq2=freq2(1:ceil(length(freq2)/2),:)
%freq2=fftshift(freq2)
f2=0:SamplingFreq2/length(freq2):SamplingFreq2*(length(Halffreq2)-1)/length(freq2)
plot(f2,Halffreq2)
axis([0 8000 0 800])
title("嚎叫")

pause
sound(wang1,SamplingFreq1)

audiowrite('C:\Users\lenovo\Desktop\recs\原声.wav',wang1,SamplingFreq1);
pause
 
sound(wang3,30000)
pause

wangAlarm1section=[wang3;flipud(wang3)]
sound(wangAlarm1section,30000)
audiowrite('C:\Users\lenovo\Desktop\recs\变音.wav',wangAlarm1section,30000);
pause

wangAlarm1=repmat(wangAlarm1section,7,1)
%注：repmat和下列4行代码功能相同，重复相同矩阵多次，使用其他语言时要用下列代码
%  wangAlarm5=wangAlarm1;
%  for i=1:5
%     wangAlarm5=[wangAlarm5;wangAlarm1];
%  end

sound(wangAlarm1*0.6,30000)
audiowrite('C:\Users\lenovo\Desktop\recs\警报1.wav',wangAlarm1,30000);
pause

wangAlarm2=repmat(wang2,8,1)
sound(wangAlarm2,56500*1.5);
audiowrite('C:\Users\lenovo\Desktop\recs\警报2.wav',wangAlarm2,56500*1.5);
pause(3.5) 

