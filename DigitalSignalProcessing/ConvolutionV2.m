%170603108 �Զ���17-1 �����  �������ڶ���
function [r,xr] = ConvolutionV2(f,startf,g,startg)
lenf=length(f);
leng=length(g);
lenr=lenf+leng-1;%rΪ���յĽ��������r�ĳ���Ϊ�����г��ȵĺͼ�һ
startr=startf+startg;%������е���ʼλ��
xr=startr:startr+lenr-1;%������еĺ�����
r=zeros(1,lenf+leng-1);
for i=1:lenf
    r(1,i:i+leng-1)= r(1,i:i+leng-1)+f(i)*g;%ֱ�ӽ�f����g��ÿһλ���ӵ�������е���Ӧλ����൱�ڶ����������˷��Ҳ���λ
end 
r;
xr;
end