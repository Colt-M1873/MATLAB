%170603108 自动化17-1 杨佳男 
clear
girlInfo=audioinfo('C:\Users\lenovo\Desktop\170603108-杨佳男-实验二\女声.wav')
boyInfo=audioinfo('C:\Users\lenovo\Desktop\170603108-杨佳男-实验二\男声.wav')
[girl,SamplingFreq1]=audioread('C:\Users\lenovo\Desktop\170603108-杨佳男-实验二\女声.wav',[40000,85000]);
[boy,SamplingFreq2]=audioread('C:\Users\lenovo\Desktop\170603108-杨佳男-实验二\男声.wav',[40000,85000]);
%此处girl\boy为一个n行2列的声音矩阵，记录着每次采样时的左右声道声音强度，n为总采样次数，第一列为左声道，第二列右声道，SamplingFreq为采样率

%时域信息
figure('name','时域')
subplot 211
left1=girl(:,1);
t1=0:1/SamplingFreq1:(length(left1)-1)/SamplingFreq1;
plot(t1,left1)
title("女声")
subplot 212
left2=boy(:,1);
t2=0:1/SamplingFreq2:(length(left2)-1)/SamplingFreq2;
plot(t2,left2)
title("男声")

%频域信息
figure('name','频域')
subplot 211
freq1=fft(left1,length(left1));
freq1=abs(freq1);%求fft结果的模值
Halffreq1=freq1(1:ceil(length(freq1)/2),:);%因为fft结果是对称的，故只取前一半
f1=0:SamplingFreq1/length(freq1):SamplingFreq1*(length(Halffreq1)-1)/length(freq1);%横轴分度值为1Hz
plot(f1,Halffreq1)
axis([0 3500 0 400])
title("女声")
subplot 212
freq2=fft(left2,length(left2));
freq2=abs(freq2);
Halffreq2=freq2(1:ceil(length(freq2)/2),:);%因为fft结果是对称的，故只取前一半
f2=0:SamplingFreq2/length(freq2):SamplingFreq2*(length(Halffreq2)-1)/length(freq2);%横轴分度值为1Hz
plot(f2,Halffreq2)
axis([0 3500 0 400])
title("男声")

%分析能量
figure('name','能量')
ene1=zeros(1,11);
ene2=zeros(1,11);
for i=1:11
    section1=freq1((i-1)*100+1:i*100,:);%以100Hz为长度分段裁剪fft取模后的结果
    ene1(i)=(1/length(section1))*sum((section1.^2));%求出每一段的能量放到ene1数列中
    section2=freq2((i-1)*100+1:i*100,:);
    ene2(i)=(1/length(section2))*sum((section2.^2));
end
a={'100','200','300','400','500','600','700','800','900','1000','1100'};
subplot (2,3,[1 2])
bar(ene1)
title("女声")
subplot 233
pie(ene1,a) 
title("女声")
subplot (2,3,[4 5])
bar(ene2)
title("男声")
subplot 236
pie(ene2,a)
title("男声")
