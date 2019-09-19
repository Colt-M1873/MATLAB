clear

info=imfinfo('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg')%获取图片信息
origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg');%读图片
figure(1)
subplot(221);
imshow(origImg);%显示原图
title('Original')

grayImg=rgb2gray(origImg);%变灰度图
grayImg1=grayImg;
subplot(222);
imshow(grayImg);
title('GrayImage')

%图像点运算，乘以某个函数
[R,C]=size(grayImg);%size求图片大小，Row，Column
for i=1:R
    for j=1:C
        if grayImg(i,j)<=50||(grayImg(i,j)>=70&&grayImg(i,j)<=90)||(grayImg(i,j)>=110&&grayImg(i,j)<=130)%类似于将图像乘上一个方波函数
            grayImg(i,j)=255;
        end
    end
end
subplot(223);
imshow(grayImg);
title('Squarewave filter')

b=double(grayImg1).*double(grayImg1)*0.0001;%grayImg的平方再乘以0.0001
subplot(224);
imshow(b);
title('(x^2)/10000')

