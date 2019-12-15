clear
length=10;%待计算的序列长度
x1=zeros(1,length);%运算次数
x2=zeros(1,length);
x3=zeros(1,length);
for N=1:length
    x1(N)=N^2+N*(N-1);
    x2(N)=(N/2)*log2(N)+N*log2(N);
    x3(N)=N;
end
figure(1)
plot(x1)
hold on
plot(x2)
hold on
plot(x3)
hold on
legend('DFT','FFT','一次函数')