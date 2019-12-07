%170603108 自动化17-1 杨佳男 卷积程序第一版
function [r,xr] = ConvolutionV1(f,startf,g,startg)
lenf=length(f);
leng=length(g);
lenr=lenf+leng-1;%r为最终的结果函数，r的长度为两序列长度的和减一
startr=startf+startg;%结果序列的起始位置
xr=startr:startr+lenr-1;%结果序列的横坐标
if lenf<leng
    t=f;f=g;g=t;%此处是为了确保让序列f长于序列g
end
leng=length(g);
g=fliplr(g);%将序列g反转，完成图解步骤中的第一步反转过程
g=g';%转换为列向量方便直接求对应位置的乘积和
f=[zeros(1,leng-1) f zeros(1,leng-1)];%将f序列左右两侧各补上一个g序列的长度，避免在做乘法时长度不够
r=zeros(1,lenr);%创建空数组用于存放就结果
for i=1:lenr-1
    r(i)=f(1:leng)*g;%计算每次移动的乘积和，即为最终结果r序列
    f=circshift(f,[0 -1]);%每次f向左平移一个单位，等价于将g向右平移一个单位
end
r;
xr;
end
