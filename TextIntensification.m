%���������֡�ͼƬ�ĺڰ���ȡ��ڰ׶Ա���ǿ
%ͨ���ȻҶȻ��ٹ�һ���ٶ�ֵ���ķ�ʽ���úڰ׶Աȸ����ԣ�����������ڰ�����
clear
origImg=imread(['C:\Users\lenovo\Desktop\888.jpg']);
grayImg=rgb2gray(origImg);
img3 = mat2gray(grayImg);%normalize
img3=img3+0.2; %���ڴ�����������������Դﵽ���󴿰׻򴿺ڲ��ֵ������Ŀ��
%img5 = mat2gray(img4);
level=graythresh(img3)
level=level+0.1
%level=0.73 %��ֱ�ӵ��ڶ�ֵ����ֵ
bwImg=imbinarize(img3,level);
subplot 311
imshow(grayImg)
subplot 312
imshow(img3)
subplot 313
imshow(bwImg)
figure (2)
imshow(bwImg)
saveas(2,['D:\op\TextIntensification\1.jpg']);%����