clear
[wang1,SamplingFreq1]=audioread('C:\Users\lenovo\Desktop\������¼ - ����\¼�� (5).wav',[36500,53000]);
[wang2,SamplingFreq2]=audioread('C:\Users\lenovo\Desktop\������¼ - ����\Ұ��.wav',[120000,155000]);
[wang3,SamplingFreq3]=audioread('C:\Users\lenovo\Desktop\������¼ - ����\¼�� (5).wav',[40000,48000]);
%�˴�wangΪһ��n��2�е��������󣬼�¼��ÿ�β���ʱ��������������ǿ�ȣ�nΪ�ܲ�����������һ��Ϊ���������ڶ�����������SamplingFreqΪ������

figure('name','ʱ��')
title("ʱ��")
subplot 211
left1=wang1(:,1);
t1=0:1/SamplingFreq1:(length(left1)-1)/SamplingFreq1;
plot(t1,left1)
title("���")

subplot 212
left2=wang2(:,1);
t2=0:1/SamplingFreq2:(length(left2)-1)/SamplingFreq2;
plot(t2,left2)
title("����")

figure('name','Ƶ��')
subplot 211
freq1=fft(left1,length(left1));
freq1=abs(freq1);
Halffreq1=freq1(1:ceil(length(freq1)/2),:)
f1=0:SamplingFreq1/length(freq1):SamplingFreq1*(length(Halffreq1)-1)/length(freq1)
%freq1=fftshift(freq1)
plot(f1,Halffreq1)
axis([0 8000 0 400])
title("���")

subplot 212
freq2=fft(left2,length(left2));
freq2=abs(freq2);
Halffreq2=freq2(1:ceil(length(freq2)/2),:)
%freq2=fftshift(freq2)
f2=0:SamplingFreq2/length(freq2):SamplingFreq2*(length(Halffreq2)-1)/length(freq2)
plot(f2,Halffreq2)
axis([0 8000 0 800])
title("����")

pause
sound(wang1,SamplingFreq1)

audiowrite('C:\Users\lenovo\Desktop\recs\ԭ��.wav',wang1,SamplingFreq1);
pause
 
sound(wang3,30000)
pause

wangAlarm1section=[wang3;flipud(wang3)]
sound(wangAlarm1section,30000)
audiowrite('C:\Users\lenovo\Desktop\recs\����.wav',wangAlarm1section,30000);
pause

wangAlarm1=repmat(wangAlarm1section,7,1)
%ע��repmat������4�д��빦����ͬ���ظ���ͬ�����Σ�ʹ����������ʱҪ�����д���
%  wangAlarm5=wangAlarm1;
%  for i=1:5
%     wangAlarm5=[wangAlarm5;wangAlarm1];
%  end

sound(wangAlarm1*0.6,30000)
audiowrite('C:\Users\lenovo\Desktop\recs\����1.wav',wangAlarm1,30000);
pause

wangAlarm2=repmat(wang2,8,1)
sound(wangAlarm2,56500*1.5);
audiowrite('C:\Users\lenovo\Desktop\recs\����2.wav',wangAlarm2,56500*1.5);
pause(3.5) 

