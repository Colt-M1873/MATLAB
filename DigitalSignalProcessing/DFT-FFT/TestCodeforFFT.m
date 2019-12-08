%170603108 ×Ô¶¯»¯17-1 Ñî¼ÑÄÐ
clear
N=2^25;
x=rand(1,N);
%  tic
%  B=mydft(x,N);
%  timemydft=toc

tic
A=myfft(x,N);
timemyfft=toc

tic
M=fft(x,N);
timefft=toc
%actualtime=timemydft/timemyfft
theoreticaltime=(N^2+N*(N-1))/((N/2)*log2(N)+N*log2(N))