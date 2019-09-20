clear

info1=imfinfo('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg')%获取图片信息
origImg1=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg');%读图片
info2=imfinfo('C:\Users\lenovo\Documents\MATLAB\imageProcessing\Dxim5yNWwAcBcqt.jpg')%获取图片信息
origImg2=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\Dxim5yNWwAcBcqt.jpg');%读图片
figure(1)
subplot(221);
imshow(origImg1);%显示原图
title('Original 1')
subplot(222);
imshow(origImg2);%显示原图
title('Original 2')

sumImg=imadd(origImg1,origImg2);
subplot(223);
imshow(sumImg);
title('OrigImg 1+ OrigImg 2')

subImg=imsubtract(origImg1,origImg2);
subplot(224);
imshow(subImg);
title('OrigImg 1- OrigImg 2')


compImg=imcomplement(origImg1);%补足图像
figure(2)
subplot(221);
imshow(origImg1);
title('Original 1')
subplot(222);
imshow(compImg);
title('Complement Img of OrigImg 1')


grayImg1=rgb2gray(origImg1);%变灰度图
subplot(223);
imshow(grayImg1);
title('GrayImg 1')

compgrayImg=imcomplement(grayImg1);%补足图像
subplot(224);
imshow(compgrayImg);
title('Complement Img of GrayImg 1')











