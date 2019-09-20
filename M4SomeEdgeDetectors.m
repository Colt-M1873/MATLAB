origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\1.9.2.JPG');
grayImg=rgb2gray(origImg);
figure('Position',[200,40,900,500],'name','各种边缘提取算子');
subplot(231);
imshow(origImg);
title("OrigImg")
subplot(232);
imshow(grayImg);
title("GrayImg")
edgeImg=edge(grayImg,'Sobel',0.033);
subplot(233);
imshow(edgeImg);
title("Sobel")
edgeImg2=edge(grayImg,'Prewitt',0.033);
subplot(234);
imshow(edgeImg2);
title("Prewitt")
edgeImg3=edge(grayImg,'log',0.002,2);
subplot(235);
imshow(edgeImg3);
title("LOG")
edgeImg4=edge(grayImg,'Canny',0.23);%普遍认为Canny算子效果最好
subplot(236);
imshow(edgeImg4);
title("Canny")









