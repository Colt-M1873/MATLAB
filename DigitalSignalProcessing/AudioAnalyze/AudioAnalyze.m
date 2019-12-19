%170603108 �Զ���17-1 ����� 
clear
girlInfo=audioinfo('C:\Users\lenovo\Desktop\170603108-�����-ʵ���\Ů��.wav')
boyInfo=audioinfo('C:\Users\lenovo\Desktop\170603108-�����-ʵ���\����.wav')
[girl,SamplingFreq1]=audioread('C:\Users\lenovo\Desktop\170603108-�����-ʵ���\Ů��.wav',[40000,85000]);
[boy,SamplingFreq2]=audioread('C:\Users\lenovo\Desktop\170603108-�����-ʵ���\����.wav',[40000,85000]);
%�˴�girl\boyΪһ��n��2�е��������󣬼�¼��ÿ�β���ʱ��������������ǿ�ȣ�nΪ�ܲ�����������һ��Ϊ���������ڶ�����������SamplingFreqΪ������

%ʱ����Ϣ
figure('name','ʱ��')
subplot 211
left1=girl(:,1);
t1=0:1/SamplingFreq1:(length(left1)-1)/SamplingFreq1;
plot(t1,left1)
title("Ů��")
subplot 212
left2=boy(:,1);
t2=0:1/SamplingFreq2:(length(left2)-1)/SamplingFreq2;
plot(t2,left2)
title("����")

%Ƶ����Ϣ
figure('name','Ƶ��')
subplot 211
freq1=fft(left1,length(left1));
freq1=abs(freq1);%��fft�����ģֵ
Halffreq1=freq1(1:ceil(length(freq1)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f1=0:SamplingFreq1/length(freq1):SamplingFreq1*(length(Halffreq1)-1)/length(freq1);%����ֶ�ֵΪ1Hz
plot(f1,Halffreq1)
axis([0 3500 0 400])
title("Ů��")
subplot 212
freq2=fft(left2,length(left2));
freq2=abs(freq2);
Halffreq2=freq2(1:ceil(length(freq2)/2),:);%��Ϊfft����ǶԳƵģ���ֻȡǰһ��
f2=0:SamplingFreq2/length(freq2):SamplingFreq2*(length(Halffreq2)-1)/length(freq2);%����ֶ�ֵΪ1Hz
plot(f2,Halffreq2)
axis([0 3500 0 400])
title("����")

%��������
figure('name','����')
ene1=zeros(1,11);
ene2=zeros(1,11);
for i=1:11
    section1=freq1((i-1)*100+1:i*100,:);%��100HzΪ���ȷֶβü�fftȡģ��Ľ��
    ene1(i)=(1/length(section1))*sum((section1.^2));%���ÿһ�ε������ŵ�ene1������
    section2=freq2((i-1)*100+1:i*100,:);
    ene2(i)=(1/length(section2))*sum((section2.^2));
end
a={'100','200','300','400','500','600','700','800','900','1000','1100'};
subplot (2,3,[1 2])
bar(ene1)
title("Ů��")
subplot 233
pie(ene1,a) 
title("Ů��")
subplot (2,3,[4 5])
bar(ene2)
title("����")
subplot 236
pie(ene2,a)
title("����")
