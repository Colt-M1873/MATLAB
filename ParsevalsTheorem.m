x=rands(1,10);
%parseval���������֤��
%�����߶���������parseval��s theorem�� sum(x.^2) = 1/N*sum(xfft.^2).����x��ԭ���ݣ�xfft��fft������ݣ�N�����ݵĳ��ȡ�
%ע��fft�Ľ���Ǹ������У����Ҫ��abs
ene1=sum(x.^2)
ene2=(1/length(x))*sum(abs(fft(x)).^2)
%����ene1=ene2

