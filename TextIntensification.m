%适用于文字、图片的黑白提取与黑白对比增强
%通过先灰度化再归一化再二值化的方式，让黑白对比更明显，更清晰分离黑白内容
clear
origImg=imread(['C:\Users\lenovo\Desktop\888.jpg']);
grayImg=rgb2gray(origImg);
img3 = mat2gray(grayImg);%normalize
img3=img3+0.2; %可在此整体调整其亮暗，以达到增大纯白或纯黑部分的面积的目的
%img5 = mat2gray(img4);
level=graythresh(img3)
level=level+0.1
%level=0.73 %或直接调节二值化阈值
bwImg=imbinarize(img3,level);
subplot 311
imshow(grayImg)
subplot 312
imshow(img3)
subplot 313
imshow(bwImg)
figure (2)
imshow(bwImg)
saveas(2,['D:\op\TextIntensification\1.jpg']);%导出