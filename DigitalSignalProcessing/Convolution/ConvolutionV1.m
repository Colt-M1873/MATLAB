%170603108 �Զ���17-1 ����� ��������һ��
function [r,xr] = ConvolutionV1(f,startf,g,startg)
lenf=length(f);
leng=length(g);
lenr=lenf+leng-1;%rΪ���յĽ��������r�ĳ���Ϊ�����г��ȵĺͼ�һ
startr=startf+startg;%������е���ʼλ��
xr=startr:startr+lenr-1;%������еĺ�����
if lenf<leng
    t=f;f=g;g=t;%�˴���Ϊ��ȷ��������f��������g
end
leng=length(g);
g=fliplr(g);%������g��ת�����ͼ�ⲽ���еĵ�һ����ת����
g=g';%ת��Ϊ����������ֱ�����Ӧλ�õĳ˻���
f=[zeros(1,leng-1) f zeros(1,leng-1)];%��f�����������������һ��g���еĳ��ȣ����������˷�ʱ���Ȳ���
r=zeros(1,lenr);%�������������ڴ�žͽ��
for i=1:lenr-1
    r(i)=f(1:leng)*g;%����ÿ���ƶ��ĳ˻��ͣ���Ϊ���ս��r����
    f=circshift(f,[0 -1]);%ÿ��f����ƽ��һ����λ���ȼ��ڽ�g����ƽ��һ����λ
end
r;
xr;
end
