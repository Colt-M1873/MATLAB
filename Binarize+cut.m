%�˶δ���Ϊ��һ��4096x4096��ͼ���н�ȡ��ʮ�ŻҶȻ��Ͷ�ֵ��֮���Сͼ�񲢽���������Ӧƴ����һ�𣬲�����������
clear
%for i=1:5
    origImg=imread('C:\Users\lenovo\MVS\Data\�½��ļ��� (2)\5.bmp');
    %figure('Position',[200,40,900,500],'name','binarized');
    figure(1)
    grayImg=rgb2gray(origImg);
    
    %��ֵ������
    level=graythresh(grayImg)%���������䷽���Otsu���ҵ�ͼƬ��һ��������ֵ��0-1֮�䣩
    bwImg=imbinarize(grayImg,level-0.05);%�˴�����levelǰ����мӼ��Դﵽ�������ͻ��߸�ʴ��Ч��
    imshow(origImg);
    saveas(1,['C:\Users\lenovo\MVS\Data\sub\5.jpg']);
    imshow(bwImg);
    saveas(1,["C:\Users\lenovo\MVS\Data\sub\,"-bw.jpg"]);
end
%%

%imshow(bwImg);
figure(2)
cut2=imcrop(grayImg,[1700,1350,1200,800]);
cut3=imcrop(bwImg,[1700,1350,1200,800]);
imshow(cut3);
%%
figure(3)
for i=1:5
    cutgray=imcrop(cut2,[360,120*i,240,160]);
    cutbw=imcrop(cut3,[360,120*i,240,160]);
    cutbw=cutbw*255;%bwͼ��ֻ��0��1��Ϊ��������ƴ��ʱ��Ҷ�ͼ��ͬ������ʾ��ʽ��˽����Ϊ0��255���˴�Ҳ�ɽ��Ҷ�ͼ��һ������Ч����һ����
    fuse=[cutgray;cutbw];%ƴ��
    imshow(fuse);
    saveas(3,['D:\op\2\',num2str(i),'.jpg']);%����
end
for i=1:5
    cutgray=imcrop(cut2,[360,120*i,240,160]);
    cutbw=imcrop(cut3,[360,120*i,240,160]);
    cutbw=cutbw*255;
    fuse=[cutgray;cutbw];
    imshow(fuse);
    saveas(3,['D:\op\2\',num2str(i+5),'.jpg']);
end


