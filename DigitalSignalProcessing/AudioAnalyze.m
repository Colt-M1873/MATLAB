clear
%[wang,SamplingFreq]=audioread('C:\Users\lenovo\Desktop\王总语录 - 副本\录音 (5).wav');
%A1=audioinfo('C:\Users\lenovo\Desktop\王总语录 - 副本\录音 (6).wav')
%A1=audioinfo('C:\Users\lenovo\Desktop\王总语录 - 副本\录音 (5).wav')

[wang1,SamplingFreq1]=audioread('C:\Users\lenovo\Desktop\王总语录 - 副本\录音 (5).wav',[36500,53000]);
[wang2,SamplingFreq2]=audioread('C:\Users\lenovo\Desktop\王总语录 - 副本\录音 (6).wav',[46500,63000]);%[36500,93000]);
%此处wang为一个n行2列的声音矩阵，记录着每次采样时的左右声道声音强度，n为总采样次数，第一列为左声道，第二列右声道，SamplingFreq为采样率
SamplingFreq1
SamplingFreq2

figure(f1,'name','时域')
title("时域")
subplot 211
left1=wang1(:,1);
plot(left1)
title("雌性野兽")
subplot 212
left2=wang2(:,1);
plot(left2)
title("雄性野兽")



figure('name','频域')
subplot 211
freq1=fft(left1);
freq1=abs(freq1);
plot(freq1)
title("雌性野兽")
subplot 212
freq2=fft(left2);
freq2=abs(freq2);
plot(freq2)
title("雄性野兽")







% sound(wang2,SamplingFreq2)
% pause

%sound(wang1,SamplingFreq1)
% pause
% sound(wang1,SamplingFreq1*3)
% pause
% sound(wang1,SamplingFreq1/2)
% pause
% sound(wang1,SamplingFreq1/3)
% 
% for i=1:50
%     sound(wang2,56500*1.5)
%     pause(0.45)   
% end


% pause
% sound(wang2,SamplingFreq2/2)
% pause
% sound(wang2,SamplingFreq2/3)


