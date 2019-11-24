%170603108 自动化17-1 杨佳男  卷积程序第二版
function [r,xr] = ConvolutionV2(f,startf,g,startg)
lenf=length(f);
leng=length(g);
lenr=lenf+leng-1;%r为最终的结果函数，r的长度为两序列长度的和减一
startr=startf+startg;%结果序列的起始位置
xr=startr:startr+lenr-1;%结果序列的横坐标
r=zeros(1,lenf+leng-1);
for i=1:lenf
    r(1,i:i+leng-1)= r(1,i:i+leng-1)+f(i)*g;%直接将f乘以g的每一位，加到结果序列的相应位置里，相当于对两数组计算乘法且不进位
end 
r;
xr;
end