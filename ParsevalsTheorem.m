x=rands(1,10);
%parseval能量定理的证明
%帕西瓦尔能量定理parseval‘s theorem： sum(x.^2) = 1/N*sum(xfft.^2).其中x是原数据，xfft是fft后的数据，N是数据的长度。
%注意fft的结果是复数数列，因此要加abs
ene1=sum(x.^2)
ene2=(1/length(x))*sum(abs(fft(x)).^2)
%最终ene1=ene2

