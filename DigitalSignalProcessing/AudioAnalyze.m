clear
%[wang,SamplingFreq]=audioread('C:\Users\lenovo\Desktop\������¼ - ����\¼�� (5).wav');
%A1=audioinfo('C:\Users\lenovo\Desktop\������¼ - ����\¼�� (6).wav')
%A1=audioinfo('C:\Users\lenovo\Desktop\������¼ - ����\¼�� (5).wav')

[wang1,SamplingFreq1]=audioread('C:\Users\lenovo\Desktop\������¼ - ����\¼�� (5).wav',[36500,53000]);
[wang2,SamplingFreq2]=audioread('C:\Users\lenovo\Desktop\������¼ - ����\¼�� (6).wav',[46500,63000]);%[36500,93000]);
%�˴�wangΪһ��n��2�е��������󣬼�¼��ÿ�β���ʱ��������������ǿ�ȣ�nΪ�ܲ�����������һ��Ϊ���������ڶ�����������SamplingFreqΪ������
SamplingFreq1
SamplingFreq2

figure(f1,'name','ʱ��')
title("ʱ��")
subplot 211
left1=wang1(:,1);
plot(left1)
title("����Ұ��")
subplot 212
left2=wang2(:,1);
plot(left2)
title("����Ұ��")



figure('name','Ƶ��')
subplot 211
freq1=fft(left1);
freq1=abs(freq1);
plot(freq1)
title("����Ұ��")
subplot 212
freq2=fft(left2);
freq2=abs(freq2);
plot(freq2)
title("����Ұ��")







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


