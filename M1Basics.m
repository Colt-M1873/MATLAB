clear

info=imfinfo('C:\Users\lenovo\Documents\MATLAB\imageProcessing\mensweardog.jpg')%获取图片信息
origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\mensweardog.jpg');%读图片
figure(1)
subplot(221);
imshow(origImg);%显示原图
title('Original')

grayImg=rgb2gray(origImg);%变灰度图
subplot(222);
imshow(grayImg);
title('GrayImage')

%二值化处理
level=graythresh(grayImg)%利用最大类间方差法（Otsu）找到图片的一个合适阈值（0-1之间）
bwImg=imbinarize(grayImg,level);%以level为阈值对图像进行二值化处理
subplot(223);
imshow(bwImg);
title('Ostu Binarize')

bwImg2=imbinarize(grayImg,0.5);%以0.5为阈值对图像进行二值化处理
subplot(224);
imshow(bwImg2);
title('Threshold 0.5 Binarize')

%手动写代码求直方图
[R,C]=size(grayImg);%size求图片大小，Row，Column
number=zeros(1,256);%这个操作类似于画了一条横轴,横轴为灰度值，纵轴number为该灰度值的点的个数
for i=1:R
    for j=1:C
        for index=1:256
            if grayImg(i,j)==index-1%查询每个像素的灰度值
                number(1,index)=number(1,index)+1;%在对应灰度值的点的个数加一
            end
        end
    end
end
figure(2)
%figure('name','直方图')
subplot(511);
plot(number),xlim([0,256]),title('手写代码求直方图')
subplot(512);
one_number=number/(R*C);
plot(one_number),xlim([0,256]),title('归一化直方图')
%%

%matlab自带直方图函数
subplot(513);
imhist(grayImg)%按默认方式直接显示直方图
%%
subplot(514);
imhist(grayImg,30)%按30个灰度级显示直方图
%%
grayHist=imhist(grayImg);%返回值为一个长度为256的数列，该数列相应位置的数值为该灰度下点的个数
subplot(515);
plot(grayHist),xlim([0,256]),title('MATLAB自带函数求直方图')
%%
%直方图均衡化
figure(3)
eqImg=histeq(grayImg);%按照默认灰度级对grayImg进行直方图均衡
subplot(211)
imshow(eqImg)
subplot(212)
imhist(eqImg)%显示均衡后的直方图
%%
figure(4)
eqImg2=histeq(grayImg,10);%按照10个灰度级对grayImg进行直方图均衡
subplot(211)
imshow(eqImg2)
subplot(212)
imhist(eqImg2)
%%

figure(5)
histFunc=10:50:255;%均衡函数，以50为步进值来区分灰度级
eqImg3=histeq(grayImg,histFunc);%
subplot(211)
imshow(eqImg3)
subplot(212)
imhist(eqImg3)

%%
%直方图规定化
% figure(6)
% eqHist=imhist(eqImg3);
% eqImg2=histeq(grayImg);
% subplot(212)
% imshow(eqImg2)
% 
% subplot(212);
% plot(eqHist),xlim([0,256]),title('直方图')

%%
%线性处理
figure(6)
subplot(221)
imshow(grayImg)
subplot(222)
plusgrayImg=grayImg+150;%整体增强亮度
imshow(plusgrayImg)
subplot(223)
plusgrayImg=grayImg/30+150;%减弱对比度并增强亮度
imshow(plusgrayImg)
subplot(224)
plusgrayImg=(plusgrayImg-150)*30;%反向运算能还原图像，但不能完全还原，因为在第一次除法时小数被取舍成了整数
imshow(plusgrayImg)






