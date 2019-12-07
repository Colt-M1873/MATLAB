%170603108 自动化17-1 杨佳男 测试代码
f=rand(1,5000);
startf=1000;%f序列的起始位置
g=rand(1,50);
startg=-1230;%g序列的起始位置
tic%开始计时
r0=conv(f,g);
t0=toc%结束计时
tic
[r1,xr1]=ConvolutionV1(f,startf,g,startg);%第一版程序
t1=toc
tic
[r2,xr2]=ConvolutionV2(f,startf,g,startg);%第二版程序
t2=toc

figure('Position',[200,40,1200,600],'name',"f序列长度为"+num2str(length(f))+"，g序列长度为"+num2str(length(g))+"时结果对比");
subplot(131)
stem(r0);
title("conv()函数运行时间为："+num2str(t0)+"秒")
subplot(132)
stem(xr1,r1);
title("第一版程序运行时间为："+num2str(t1)+"秒")
subplot(133)
stem(xr2,r2)
title("第二版程序运行时间为："+num2str(t2)+"秒")